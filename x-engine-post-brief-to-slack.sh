#!/bin/bash
# Post a Reply Engine brief to #x-engine-channel via Claude + Slack MCP
# Usage: x-engine-post-brief-to-slack.sh [path-to-brief.md]
#   Defaults to today's brief if no argument given.

set -uo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
export HOME="/Users/moltbot"

WORKSPACE="/Users/moltbot/clawd/skills/x-engine/x-engine-skill"
SLACK_CHANNEL="C0AGXSW1X8A"
DATE=$(date +%Y-%m-%d)

# Use argument or default to today's brief
BRIEF="${1:-$WORKSPACE/output/reply-brief-$DATE.md}"

if [ ! -f "$BRIEF" ]; then
  echo "ERROR: Brief not found at $BRIEF"
  exit 1
fi

echo "Posting brief to #x-engine-channel: $BRIEF"

PROMPT="Read the file at $BRIEF. Post the contents to Slack channel #x-engine-channel (ID: $SLACK_CHANNEL) using the slack_post_message MCP tool.

Format for Slack readability:
- Post Part 2 (The Targets) as the main message. Include every target with its score, link, author, original post excerpt, suggested reply, pattern, and gift.
- Add a summary header at the top: date, number of targets, kill rate, and the top 3 priority targets.
- If the message is too long for a single Slack post, split into multiple messages (one per 2-3 targets).
- Do NOT skip any targets. Post all of them."

cd "$WORKSPACE"
/opt/homebrew/bin/claude -p "$PROMPT" \
  --dangerously-skip-permissions \
  2>&1

echo "Done."
