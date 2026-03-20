# X Engine

The X Engine is an AI-powered content operations system that turns Mike Quoc's daily activity - Slack messages and the X/Twitter ecosystem - into high-value X/Twitter content. Built and operated by Dakota Nunley (Director of Content & Authority Strategy, Product.ai).

The system runs on Claude Code, executes via scheduled cron jobs on Moltbot, and delivers output to Slack. Mike reviews and posts from his phone.

---

## Two Independent Systems

### System 1: Reply Engine (Daily)

Scouts high-value reply targets from the X ecosystem, scores them on 6 weighted dimensions, drafts suggested replies in Mike's voice, and delivers a daily brief with exactly 5 targets.

**Pipeline stages:**

1. **Scout** - Collects 30-50 candidate posts via X Twitter MCP (primary) and WebSearch (fallback). Checks Mike's Slack activity for signal on what he cares about today. Runs dedup against the last 72 hours of briefs, verifies follower counts via Nitter/SocialBlade/Google fallback chain, and validates all timestamps using X's Snowflake ID decoder.
2. **Score** - Evaluates each candidate on 6 dimensions (Territory Fit 2x, Conversation Opportunity 2x, Account Quality 1x, Post Freshness 1x, Reply Visibility 1x, Multi-Signal Potential 1x). Max score: 80. Hard cutoff at 48. Applies post-scoring gates for thematic concentration, author concentration (max 2 per author), and author recency (repeat authors from last 7 days penalized). Outputs exactly 5 targets via backfill loop.
3. **Draft** - Writes one reply per target in Mike's voice (The Diagnostic Peer). Each draft goes through a 4-gate quality check: Scroll Test, Voice Test, Gift Test, and Outside-In Check. A brief-level Monotony Test catches pattern and gift repetition across the full set.
4. **Deliver** - Formats a two-part brief: Part 1 (scouting provenance for Dakota) and Part 2 (targets for Mike). Posts summary to Slack. Every brief includes a Pipeline Compliance Check block at the top.

**Schedule:** Daily at 6pm via Moltbot cron job.

**Trigger command:** "Run the Reply Engine" (or any variation).

### System 2: Slack-to-X Pipeline (On-Demand + Daily Scan)

Takes Mike's internal Slack messages and transforms them into public X posts. Works in two modes:

**On-demand mode** - Dakota pastes a specific Slack message with channel context and speed mode (time-sensitive or normal). The pipeline scores it, transforms it from inside-out (internal framing) to outside-in (reader-facing), runs it through a 7-gate quality check, and presents it for Mike's approval.

**Daily scan mode** - Searches all public Slack channels for Mike's messages from the last 24 hours. Surfaces anything that scores 48+ on the Slack-to-X scoring engine.

**Pipeline stages:**

1. **Flag** - Dakota provides the message (on-demand) or the scanner identifies it (daily scan).
2. **Score** - 6 dimensions: Insight Sharpness 2x, Outsider Legibility 2x, Timeliness 1x, Territory Fit 1x, Now/Near/Far Alignment 1x, Sensitivity Risk 1x. Max 80. Kill below 48.
3. **Transform** - Converts internal message to public post using the Context Pyramid (Bedrock axioms, Thematic Currents, Daily Moment) and Now/Near/Far formula. Strips all sensitive information. Runs through 7-gate quality check (Scroll, Gift, Voice, Throughline, Follow, Outside-In, Outsider Legibility).
4. **Approve** - Presents to Mike via Slack DM with original message, transformed post, quality gate results, and decision options (Approve / Kill / Hold).

**Schedule:** Mon/Wed/Fri scan via Moltbot cron job. On-demand anytime.

**Trigger commands:** "Scan Slack for X-worthy messages" (daily scan) or paste a Slack message in the specified format (on-demand).

### Thematic Scan (Bi-Weekly Support System)

A Layer 2 context generator that scans Mike's Slack messages from the past 30-60 days, identifies thematic clusters (topics Mike returns to 3+ times across different conversations), cross-references them against the current X zeitgeist, and maps content opportunities. Output lives at `output/thematic-context.md` and is referenced by both the Reply Engine drafter and Slack-to-X transform to connect daily content to larger narratives Mike is building.

**Trigger command:** "Run the Thematic Scan" (or any variation).

---

## Project Structure

```
x-engine/
  CLAUDE.md                              # System prompt and orchestrator
  README.md                              # This file
  grounding/
    individual/
      mike-quoc-v2.md                    # Mike's voice profile (symlink from Ghost Engine)
    universal-grounding.md               # Shared content standards (symlink from Ghost Engine)
  prompts/
    reply-engine/
      agent.md                           # Reply Engine orchestrator prompt
      scout.md                           # Stage 1: Target scouting
      scoring.md                         # Stage 2: 6-dimension scoring engine
      drafter.md                         # Stage 3: Reply drafting
    slack-to-x/
      agent.md                           # Slack-to-X orchestrator prompt
      scoring.md                         # Slack message scoring engine
      transform.md                       # Inside-out to outside-in transformation
      thematic-scan.md                   # Bi-weekly Layer 2 context generator
    shared/
      quality-gate-replies.md            # 4-gate quality check for replies
      quality-gate-posts.md              # 7-gate quality check for posts
      sensitivity-screen.md              # GREEN / YELLOW / RED editorial sensitivity tiers
      x-ecosystem-setup.md              # Tracked accounts and keyword lists
  templates/
    reply-targets-daily.md               # Daily brief output format
    slack-to-x-approval.md               # Mike's approval request format
  spec/
    mike-brief.md                        # Strategy spec for Mike's review
  output/                                # Completed briefs, thematic context
```

---

## Mike's Voice: The Diagnostic Peer

Every piece of content the X Engine produces must sound like Mike. His voice profile (the full spec lives in `grounding/individual/mike-quoc-v2.md`) has these core properties:

**Tone:** Inside the conversation, not above it. Names the mechanism underneath the claim. Active voice. Punchy. Binary.

**Semantic territory:** AI commerce, agents in production, trust/verification, operational AI, agent economics. Every reply and post must map to this territory. Off-territory content dilutes the embedding gravity well.

**Reply patterns:** Reframe, Binary Reduction, Contextual Wedge, Builder's Aside, Short Punch, Contrarian Redirect. Max 2 uses of any pattern per brief.

**Reply length:** 1-4 sentences. Most are 2-3.

**The Gift Principle:** Every piece of content must deliver value to the reader. No agreement-only replies. No surface commentary. The reader walks away with a reframe, a question, an operational insight, a framework, a prediction, or a warning.

**Outside-In framing:** The reader's problem is the subject. Mike's experience is the evidence, not the lead.

**Banned Terms:** Delve, Landscape, Tapestry, Foster, Unlock, Holistic, Synergistic, Exciting, Revolutionize, Transform, Empower, Leverage, Synergy.

**No em dashes.** Hyphens only.

---

## Scoring System

Both pipelines use a 6-dimension weighted scoring engine with a max score of 80 and a hard cutoff at 48 (60%).

### Reply Engine Scoring Dimensions

| Dimension | Weight | What It Measures |
|-----------|--------|-----------------|
| Territory Fit | 2x | How well the post maps to Mike's semantic territory |
| Conversation Opportunity | 2x | Is there space for Mike to add something the replies are missing? |
| Account Quality | 1x | Right audience, right size (5K-500K), active comment section |
| Post Freshness | 1x | How fresh the conversation is (24h ideal, 72h hard cap) |
| Reply Visibility | 1x | How likely Mike's reply is to be seen (fewer replies = better) |
| Multi-Signal Potential | 1x | Will the reply trigger dwell, replies, profile clicks, follows? |

### Reply Engine Post-Scoring Gates

After scoring, the pipeline runs additional checks before finalizing the top 5:

- **Thematic Concentration Check** - No more than 2 targets entering the same thematic conversation
- **Author Concentration Check** - Max 2 targets from any single author (hard cap)
- **Author Recency Check** - Authors who appeared in briefs from the last 7 days get a -5 penalty
- **People-vs-Brand Guardrail** - Targets must be individual people accounts, not media orgs or corporate brand accounts
- **Backfill Loop** - If any target gets killed by a post-scoring gate, backfill from the scored pool until exactly 5 targets survive

### Slack-to-X Scoring Dimensions

| Dimension | Weight | What It Measures |
|-----------|--------|-----------------|
| Insight Sharpness | 2x | Is there a non-obvious insight the public would care about? |
| Outsider Legibility | 2x | Can someone outside Demand.io understand this? |
| Timeliness | 1x | Is there a time-sensitive window? |
| Territory Fit | 1x | Does this map to Mike's semantic territory? |
| Now/Near/Far Alignment | 1x | Can it map to the content formula? |
| Sensitivity Risk | 1x | What is the information leakage or reputation risk? |

---

## Quality Gates

### Reply Quality Gate (4 checks)

1. **Scroll Test** - Would someone stop and pay attention?
2. **Voice Test** - Does it sound like Mike? Active voice, punchy, no Banned Terms, 1-4 sentences.
3. **Gift Test** - What does the reader get that they didn't have before?
4. **Monotony Test** (brief-level) - Pattern distribution, gift diversity, topic range, profile scroll test.

### Post Quality Gate (7 checks)

1. **Scroll Test** - Does the opening hook attention?
2. **Gift Test** - Framework-level gift required (observation-level fails for posts).
3. **Voice Test** - Sharp, active, in Mike's voice.
4. **Throughline Test** - One clear idea (One Nail Rule).
5. **Follow Test** - Does this earn a follow for @michaelquoc specifically?
6. **Outside-In Test** - First sentence centers the reader's problem, not Mike's experience.
7. **Outsider Legibility Test** - Every word parseable by someone who has never heard of Demand.io.

---

## Sensitivity Screen

Every target and post candidate gets tagged with an editorial sensitivity tier:

- **GREEN** - Post freely. No editorial risk.
- **YELLOW** - Dakota reviews framing before Mike posts. Live topics, ecosystem dynamics, could be screenshot-shared out of context.
- **RED** - Skip by default. Mike explicitly opts in. Direct competitor commentary, political AI policy, legal disputes.

The sensitivity tier runs parallel to the numerical score. A RED target can score 70/80 and still require explicit opt-in.

---

## Pipeline Compliance

Every Reply Engine brief includes a mandatory compliance block at the top:

```
## PIPELINE COMPLIANCE CHECK
- [ ] Grounding files loaded
- [ ] Thematic context loaded (or noted as unavailable)
- [ ] Dedup gate: PASSED / FIRST RUN / FAILED
- [ ] Follower verification: [X] accounts checked, [Y] killed
- [ ] Snowflake timestamps: All validated YES / NO
- [ ] Engagement floors enforced: YES / count killed
- [ ] Sensitivity screen: Applied YES / NO
- [ ] Data confidence: [X]% VERIFIED, [Y]% ESTIMATED, [Z]% UNVERIFIED
- [ ] Scoring input validation: Dedup proof block YES / NO, Follower log YES / NO
```

If any gate shows NO or FAILED, the brief is a draft, not a deliverable. Dakota reviews before it reaches Mike.

---

## Data Confidence Levels

- **VERIFIED** - Data from X Twitter MCP (the primary source). Exact follower counts, engagement metrics, full post text.
- **ESTIMATED** - Data inferred from WebSearch snippets (fallback). Approximate follower counts, rough engagement, possibly truncated text. Triggers -2 score penalty.
- **UNVERIFIED** - Verification attempted but all methods failed. Triggers -3 score penalty. Combined with zero engagement = hard kill.

---

## Infrastructure and Deployment

### How Changes Get Deployed

1. **Edit prompts** in Claude Code (Cursor terminal)
2. **Pull first** - `git pull` to match the remote (pick up any changes from Dylan)
3. **Make changes** - Edit grounding files, prompt files, templates
4. **Push** - `git push origin claude/eager-franklin:main`
5. **Sync Moltbot** - DM Moltbot: "Git pull from repo to make sure /Users/moltbot/clawd/skills/x-engine is up to date on latest main branch"

### Runtime Architecture

- **Claude Code** runs the pipeline against the prompt files in this repo
- **Moltbot** is the always-on machine that executes scheduled cron jobs and pulls from the GitHub `main` branch
- **X Twitter MCP** is the primary data source for scouting (X API v2)
- **Slack MCP** provides Mike's internal signal (messages, reactions, threads)
- **WebSearch/WebFetch** serve as fallback for X data and follower verification

### Slack Channels Monitored

| Channel | ID | Signal Type |
|---------|-----|------------|
| #ai-news | C04E0MPQFUL | Mike's hot takes and link shares |
| #productai | C05P7AAPHGC | Shipping activity |
| #ai-agents | C0ADNUNSXN3 | Agent ecosystem discussions |
| #ai-dev | C04UR8UHJJC | Technical discussions, engineering decisions |
| #ai-prompting | C053YUZQ8JJ | Prompt engineering, context engineering |

Mike's Slack user ID: U02BJAWG9

---

## Non-Negotiable Rules

1. Load grounding files first. Every session.
2. Never use Banned Terms.
3. No em dashes. Hyphens only.
4. Scoring integrity. Never inflate scores. The cutoff is 48/80.
5. Territory lock. Every piece of content maps to Mike's semantic territory.
6. The Gift Principle. Every reply and post delivers value.
7. Voice fidelity. The Diagnostic Peer. Inside the conversation, not above it.
8. Sensitivity screen. Strip all internal details. When in doubt, flag for Dakota.
9. Pipeline compliance. Every brief includes the compliance block. No silent skips.
10. Conservative defaults. When data is degraded, kill the candidate. Fail loud, not quiet.

---

## Team

- **Dakota Nunley** - Operator. Runs the pipeline daily. Reviews briefs. Manages grounding updates.
- **Mike Quoc** - Subject. Reviews targets and posts from his phone. Final approval on all content.
- **Dylan Ler** - Engineering. Manages Moltbot, cron jobs, MCP connections, infrastructure.
