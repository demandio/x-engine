#!/bin/bash
# X Engine Reply Engine - Daily Cron Job
# Schedule: 6 AM PST daily
# Generates reply targets via claude code and posts to #x-engine-channel (C0AGXSW1X8A)

set -uo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
export HOME="/Users/moltbot"
export TZ="America/Los_Angeles"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORKSPACE="/Users/moltbot/clawd/skills/x-engine/x-engine-skill"
OUTPUT_DIR="$WORKSPACE/output"
LOG_DIR="$HOME/.clawdbot/cron/runs"
DATE=$(date +%Y-%m-%d)
OUTPUT_FILE="$OUTPUT_DIR/reply-brief-$DATE.md"
LOG_FILE="$LOG_DIR/x-engine-reply-engine-$DATE.log"
SLACK_CHANNEL="C0AGXSW1X8A"
SEND_SLACK="$HOME/.clawdbot/send-to-slack.sh"
MAX_RUNTIME=7200  # 2 hours max

mkdir -p "$OUTPUT_DIR" "$LOG_DIR"

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"; }

log "=== Reply Engine Daily Run: $DATE ==="
log "Workspace: $WORKSPACE"
log "Output: $OUTPUT_FILE"

# Notify start
"$SEND_SLACK" "claude-code" "started" \
  "Reply Engine daily run starting for $DATE" "$SLACK_CHANNEL" || true

# The prompt points Claude at the agent orchestrator prompt which contains
# the full autonomous pipeline (Scout -> Score -> Draft -> Deliver),
# delivery channel (#x-engine-channel C0AGXSW1X8A), and all rules.
# CLAUDE.md in the workspace directory is also loaded automatically.
PROMPT="Run the Reply Engine for Mike Quoc. Read /Users/moltbot/clawd/skills/x-engine/x-engine-skill/prompts/reply-engine/agent.md and execute the full 4-stage pipeline end-to-end. No human input needed - run autonomously.

Save the complete brief to output/reply-brief-${DATE}.md

Today's date: ${DATE}
Signal period: Last 24 hours."

log "Starting claude -p with --dangerously-skip-permissions"
log "Max runtime: ${MAX_RUNTIME}s"

# Run Claude Code from the x-engine-skill workspace.
cd "$WORKSPACE"
log "Prompt: ${PROMPT:0:100}..."
log "Running claude now..."

# Run claude in background writing stream-json to a temp file.
# Tail + filter that file in foreground for real-time progress.
STREAM_FILE=$(mktemp /tmp/x-engine-stream.XXXXXX)
trap "rm -f $STREAM_FILE" EXIT

/opt/homebrew/bin/claude -p "$PROMPT" \
  --dangerously-skip-permissions \
  --verbose \
  --output-format stream-json \
  > "$STREAM_FILE" 2>&1 &
CLAUDE_PID=$!

log "Claude PID: $CLAUDE_PID"

# Tail the stream file and filter for progress, until claude exits.
tail -f "$STREAM_FILE" | python3 -u "$SCRIPT_DIR/stream-filter.py" &
TAIL_PID=$!

# Wait for claude to finish.
wait $CLAUDE_PID
EXIT_CODE=$?

# Give tail a moment to catch up, then kill it.
sleep 1
kill $TAIL_PID 2>/dev/null || true

# Copy raw stream to log file for audit.
cat "$STREAM_FILE" >> "$LOG_FILE"

log "Claude exited with code: $EXIT_CODE"

# Check if output file was created
if [ -f "$OUTPUT_FILE" ]; then
  log "Output file created: $OUTPUT_FILE"
  TARGETS=$(grep -c "^## Target" "$OUTPUT_FILE" 2>/dev/null || echo "0")
  log "Targets in brief: $TARGETS"
else
  log "WARNING: Output file not created at $OUTPUT_FILE"
fi

# Send completion notification
if [ $EXIT_CODE -eq 0 ]; then
  "$SEND_SLACK" "claude-code" "done" \
    "Reply Engine completed for $DATE. Check #x-engine-channel for targets." "$SLACK_CHANNEL" || true
else
  "$SEND_SLACK" "claude-code" "error" \
    "Reply Engine failed for $DATE (exit code $EXIT_CODE). Check logs: $LOG_FILE" "$SLACK_CHANNEL" || true
fi

log "=== Reply Engine run finished ==="
exit $EXIT_CODE
