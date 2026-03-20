# X Engine Skill

Mike Quoc's X/Twitter content strategy pipeline. Two systems: Reply Engine (daily automated reply targets) and Slack-to-X Pipeline (on-demand post transformation). Fully autonomous - no human approval required in the pipeline.

## Quick Start

### Reply Engine (Daily Automated - 6 AM PST Cron)

Runs automatically via cron. To run manually:

```bash
/Users/moltbot/clawd/skills/x-engine/x-engine-reply-engine-daily.sh
```

This spins up `claude -p --dangerously-skip-permissions` from the `x-engine-skill/` workspace, executes the full 4-stage pipeline (Scout -> Score -> Draft -> Deliver), and posts results to **#x-engine-channel** (C0AGXSW1X8A) as a threaded Slack message.

### Post Brief to Slack (Ad-Hoc)

Post a previously generated reply brief to Slack:

```bash
# Post today's brief
/Users/moltbot/clawd/skills/x-engine/x-engine-post-brief-to-slack.sh

# Post a specific brief
/Users/moltbot/clawd/skills/x-engine/x-engine-post-brief-to-slack.sh /Users/moltbot/clawd/skills/x-engine/x-engine-skill/output/reply-brief-2026-03-11.md
```

### Slack-to-X Daily Scan (Daily Automated - 5 PM PST Cron)

Scans all of Mike's Slack messages from the last 24 hours, scores them, transforms passing ones into X post drafts, and delivers to #x-engine-channel. Runs automatically via cron. To run manually:

```bash
./x-engine-slack-to-x-daily.sh
```

### Slack-to-X Pipeline (On-Demand)

Run interactively in Claude Code from the `x-engine-skill/` directory:

```
Slack message from Mike:
---
[paste message here]
---
Channel: #channel-name
Context: [what prompted this]
Speed: [time-sensitive / normal]
```

### Thematic Scan (Bi-Weekly)

```
Run the Thematic Scan
```

Scans Mike's Slack messages from the past 30-60 days, identifies thematic clusters, and updates `output/thematic-context.md`.

## Architecture

```
x-engine/
  SKILL.md                             # This file
  x-engine-skill/
    CLAUDE.md                          # System prompt
    .mcp.json                          # Slack + X Twitter MCP config
    grounding/                         # Voice profiles (symlinks)
    prompts/
      reply-engine/                    # 4-stage daily pipeline
        agent.md                       # Orchestrator
        scout.md                       # Stage 1: Target scouting (X Twitter MCP primary)
        scoring.md                     # Stage 2: 6-dimension scoring (max 80, cutoff 48)
        drafter.md                     # Stage 3: Reply drafting + quality gates
      slack-to-x/                      # On-demand post pipeline
        agent.md                       # Orchestrator
        scoring.md                     # Message scoring engine
        transform.md                   # Transformation engine + Context Pyramid
        thematic-scan.md               # Layer 2 context generator (bi-weekly)
      shared/                          # Quality gates, sensitivity screen, ecosystem setup
        quality-gate-replies.md        # 4-gate (Scroll, Voice, Gift, Monotony)
        quality-gate-posts.md          # 7-gate (Scroll, Gift, Voice, Throughline, Follow, Outside-In, Outsider)
        sensitivity-screen.md          # 3-tier (GREEN/YELLOW/RED)
        x-ecosystem-setup.md           # Tracked accounts and keywords
    templates/                         # Output format templates
    spec/                              # Strategy specs
    output/                            # Generated briefs
```

## MCP Dependencies

Both configured in `x-engine-skill/.mcp.json` and `~/.claude/.mcp.json`:

- **Slack MCP** (`@modelcontextprotocol/server-slack`) - Channel reading, message posting, thread replies, file uploads
- **X Twitter MCP** (`@enescinar/twitter-mcp`) - Tweet search, user lookup (primary scouting source, paid Pro tier - no rate limiting delays)

## Key Features

- **Fully autonomous** - No human approval gates. Pipeline runs end-to-end.
- **Parallel execution** - Subagents parallelize scouting, scoring, and drafting stages.
- **Thread-based Slack delivery** - Parent summary + .md attachment, each target as a thread reply.
- **Sensitivity screen** - 3-tier editorial safety (GREEN/YELLOW/RED).
- **Deduplication gate** - Checks last 72 hours of output to prevent repeat targets.
- **Snowflake timestamp validation** - All post ages verified via tweet ID decoding.
- **Data confidence labeling** - VERIFIED/ESTIMATED/UNVERIFIED on all metrics.

## Delivery

- **Channel:** #x-engine-channel (C0AGXSW1X8A)
- **Format:** Thread-based (parent summary + .md attachment + one reply per target)
- **Reply Engine output:** `output/reply-brief-YYYY-MM-DD.md`
- **Slack-to-X output:** `output/slack-to-x-scan-YYYY-MM-DD.md`

## Schedule (macOS LaunchAgents)

| Time (PST) | LaunchAgent | Script | Status |
|---|---|---|---|
| 6:00 AM daily | `com.xengine.reply-engine` | `x-engine-reply-engine-daily.sh` | Active |
| 5:00 AM Mon/Wed/Fri | `com.xengine.slack-to-x` | `x-engine-slack-to-x-daily.sh` | Disabled |

Plist files in `~/Library/LaunchAgents/`. Logs in `./logs/`. Mac must be awake.

```bash
# Manually trigger
launchctl start com.xengine.reply-engine

# Enable slack-to-x
launchctl enable gui/$(id -u)/com.xengine.slack-to-x
```
