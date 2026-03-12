#!/bin/bash
# X Engine Slack-to-X - Daily Scan
# Scans Mike's Slack messages from the last 24 hours, scores them,
# transforms passing ones into X post drafts, delivers to #x-engine-channel.
# Portable: works on any machine with claude CLI installed

set -uo pipefail

export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$HOME/bin:$PATH"
export TZ="America/Los_Angeles"

# All paths relative to this script's location
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORKSPACE="$SCRIPT_DIR/x-engine-skill"
OUTPUT_DIR="$WORKSPACE/output"
LOG_DIR="$SCRIPT_DIR/logs"
DATE=$(date +%Y-%m-%d)
OUTPUT_FILE="$OUTPUT_DIR/slack-to-x-scan-$DATE.md"
LOG_FILE="$LOG_DIR/x-engine-slack-to-x-$DATE.log"
SLACK_CHANNEL="C0AGXSW1X8A"
MAX_RUNTIME=3600  # 1 hour max

mkdir -p "$OUTPUT_DIR" "$LOG_DIR"

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"; }

# Find claude CLI
CLAUDE_BIN=$(command -v claude 2>/dev/null || true)
if [ -z "$CLAUDE_BIN" ]; then
  log "ERROR: claude CLI not found in PATH. Install it first."
  exit 1
fi

log "=== Slack-to-X Daily Scan: $DATE ==="
log "Workspace: $WORKSPACE"
log "Output: $OUTPUT_FILE"
log "Claude: $CLAUDE_BIN"

PROMPT="Scan Slack for X-worthy messages. Read prompts/slack-to-x/agent.md for the full pipeline instructions.

Search all public Slack channels for Mike's messages (user ID: U02BJAWG9) from the last 24 hours using slack_search_public with from:<@U02BJAWG9>.

For each message that looks like it could be a public X post:
1. Score it using prompts/slack-to-x/scoring.md (6 dimensions, cutoff 48/80)
2. Transform passing messages using prompts/slack-to-x/transform.md
3. Run each through prompts/shared/quality-gate-posts.md

Save all results to output/slack-to-x-scan-${DATE}.md

Then post a summary to Slack channel #x-engine-channel (C0AGXSW1X8A):
- Parent message: date, number of messages scanned, number that passed scoring, top candidates
- Thread replies: one per passing message with the transformed X post draft, score, and quality gate results

No human input needed - run autonomously.
Today's date: ${DATE}"

log "Starting claude -p with --dangerously-skip-permissions"
log "Max runtime: ${MAX_RUNTIME}s"

cd "$WORKSPACE"
log "Prompt: ${PROMPT:0:100}..."
log "Running claude now..."

# Run claude in background writing stream-json to a temp file.
# Tail + filter that file in foreground for real-time progress.
STREAM_FILE=$(mktemp /tmp/x-engine-slack-to-x.XXXXXX)
trap "rm -f $STREAM_FILE" EXIT

"$CLAUDE_BIN" -p "$PROMPT" \
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
  POSTS=$(grep -c "^## SLACK-TO-X" "$OUTPUT_FILE" 2>/dev/null || echo "0")
  log "Posts surfaced: $POSTS"
else
  log "WARNING: Output file not created at $OUTPUT_FILE"
fi

log "=== Slack-to-X scan finished ==="
exit $EXIT_CODE
