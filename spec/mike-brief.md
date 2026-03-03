# @michaelquoc X Strategy v2: The Reply Engine + Slack-to-X Pipeline

**For:** Mike Quoc
**From:** Dakota Nunley
**Date:** February 19, 2026
**Status:** Prototype complete. Ready for your review and 1-week live trial.
**Provenance:** STRATEGIC BRIEF | @michaelquoc X/Twitter Strategy v2, ARC Axioms | X/Twitter Growth Physics v2.0

---

## The Shift

At ~6,000 followers, broadcasting original posts is the wrong play. The algorithm physics are clear:

- **Reply economy dominates for sub-25K accounts** (EMPIRICALLY OBSERVED). Breakout founders spend 60-80% of their visible activity on replies. Replies on high-traffic posts from larger accounts expose your profile to their audience.
- **Topic consistency creates embedding gravity** (CODE-CONFIRMED). X's two-tower retrieval system encodes each user's engagement history against each post's content. Every on-topic post strengthens your association with the AI commerce niche. Every off-topic post dilutes it.
- **Two exceptional posts outperform seven mediocre posts** (CODE-CONFIRMED). Author diversity decay applies exponential per-author scoring decay. High-frequency posting is punished.
- **External links kill reach** (EMPIRICALLY OBSERVED). Premium accounts achieve ~0.25-0.3% on link posts vs. higher rates on native content. All URLs go in the first reply only.

The v2 strategy shifts your daily activity mix:

| Activity | Allocation | System |
|----------|-----------|--------|
| Replies on others' high-traffic posts | 60-70% | Reply Engine (automated daily) |
| Reactive QRTs | 15-20% | Slack-to-X Pipeline |
| Original posts | 10-15% | Slack-to-X Pipeline |
| Build-in-public | 5-10% | Slack-to-X Pipeline |

We are not posting more. We are posting where the audience already is.

---

## What Your Day Looks Like

### Morning (Daily Brief)

A brief lands in your Slack DM. 8-12 reply targets, each with:
- The original post (with direct link so you can verify it)
- Why it scored high (1-2 sentence rationale)
- A suggested reply drafted in your voice
- Post age and freshness indicator

You scan from your phone. For each target:
- ✅ = Post this reply as-is
- ✏️ = Thread your edited version, system posts that instead
- ❌ = Skip this target
- ⏸️ = Hold for later

**Target: 5-8 replies per day. Under 30 minutes total across 2-3 sessions.**

### On-Demand (Slack-to-X)

The system scans your Slack activity daily and scores every message against 6 dimensions. When one of your messages scores high enough to be worth posting publicly, a transformed X post lands in your DM for approval. Same emoji controls.

The transformation strips all internal references (Product.ai strategy details, team member names, codenames, timelines) and flips the framing from inside-out (talking to your team) to outside-in (talking to the reader).

**Target: Under 2 minutes per approval decision.**

### Total Daily Time: ~30 minutes

Everything else is automated. Nothing publishes without your explicit approval.

---

## How It Works

### System 1: The Reply Engine

```
6:00 AM - Automated daily run
     |
     |-- Scouts 30-50 candidates from the X ecosystem
     |   (Tracked accounts in your niche, trending AI topics,
     |    cross-referenced with your Slack activity for context)
     |
     |-- Scores each on 6 dimensions:
     |   Territory Fit (2x weight)
     |   Conversation Opportunity (2x weight)
     |   Account Quality (1x)
     |   Post Freshness (1x)
     |   Reply Visibility (1x)
     |   Multi-Signal Potential (1x)
     |
     |-- Hard cutoff: anything below 48/80 is killed
     |   (Prototype kill rate: 64% - the engine has taste)
     |
     |-- Drafts replies for survivors using your voice patterns
     |   (Reframe, Binary Reduction, Contextual Wedge,
     |    Builder's Aside, Short Punch, Contrarian Redirect)
     |
     |-- Quality gate: Scroll Test, Voice Test, Gift Test
     |
     v
Delivered to your Slack DM
```

### System 2: The Slack-to-X Pipeline

```
Your Slack messages across ALL public channels (searched via your user ID)
     |
     |-- Automated daily scan of your activity across the full workspace
     |   (Not limited to specific channels - catches insights you drop
     |    in threads, side channels, and ad hoc conversations.
     |    Dakota can also manually flag messages for
     |    time-sensitive or edge-case processing)
     |
     |-- Scores each on 6 dimensions:
     |   Insight Sharpness (2x weight)
     |   Outsider Legibility (2x weight)
     |   Timeliness (1x)
     |   Territory Fit (1x)
     |   Now/Near/Far Alignment (1x)
     |   Sensitivity Risk (1x)
     |
     |-- Hard cutoff: below 48/80 = killed
     |
     |-- Transforms survivors: strips internal context,
     |   flips outside-in, applies Now/Near/Far formula,
     |   runs 5-gate quality check
     |
     |-- Sensitivity screen catches and strips:
     |   Customer names, revenue figures, unreleased features,
     |   internal codenames, competitor strategy, team data
     |
     v
Approval template in your Slack DM
```

---

## Live Prototype Outputs

The following outputs were generated from a real prototype run on February 19, 2026, using live Slack data and real-time X ecosystem signals. Nothing below is hypothetical.

### Reply Engine: Sample Targets

**How the prototype performed:**
- 28 raw signals collected (18 from your Slack context, 10 from the X ecosystem)
- 22 candidates extracted and scored
- 14 killed (64% kill rate)
- 8 targets surfaced with drafted replies, all passed quality gate

Here are 4 representative targets from the run:

---

**TARGET 1: The Agentic Commerce Verification Gap**

**Original Post:** Discussion of Google's Universal Commerce Protocol (UCP) and how it creates a standard schema layer for agent-to-merchant communication.

**Score: 72/80** (Highest of the batch)
- Territory Fit: 10/10 (2x) = 20
- Conversation Opportunity: 9/10 (2x) = 18
- Account Quality: 8/10 = 8
- Post Freshness: 9/10 = 9
- Reply Visibility: 8/10 = 8
- Multi-Signal: 9/10 = 9

**Scoring rationale:** Dead center of your semantic territory. Google built the protocol layer (UCP), Visa built the payment auth layer (TAP), but nobody is building the product truth layer. You are. The conversation opportunity is wide open because nobody has made this connection yet.

**Drafted Reply:**
> Google UCP solves the schema problem. Visa TAP solves the payment auth problem. Nobody is solving the product truth problem. Your agent can now talk to merchants and pay them. It still has no way to verify that what it is buying is actually what it claims to be. The protocol layer and the payment layer are commoditized. The verification layer is the bottleneck.

**Quality Gate:** PASS (3/3) - Scroll: hooks immediately with the UCP/TAP framing. Voice: Binary Reduction pattern, active, punchy. Gift: reader walks away understanding the missing layer in the agentic commerce stack.

---

**TARGET 2: Claude Opus 4.6 Context Window**

**Original Post:** Anthropic's announcement of Claude Opus 4.6 with 1M token context and 76% MRCR v2 score (vs. Sonnet 4.5's 18.5%).

**Score: 58/80**
- Territory Fit: 7/10 (2x) = 14
- Conversation Opportunity: 8/10 (2x) = 16
- Account Quality: 7/10 = 7
- Post Freshness: 6/10 = 6
- Reply Visibility: 7/10 = 7
- Multi-Signal: 8/10 = 8

**Scoring rationale:** Adjacent territory (model capabilities through operational lens). The conversation opportunity is the operational implication nobody is discussing: what 76% MRCR means for production agent systems that need to maintain context across complex multi-step tasks.

**Drafted Reply:**
> 76% on 8-needle 1M MRCR vs. 18.5% for Sonnet 4.5. This is not an incremental upgrade. This is the difference between an agent that forgets what it was doing halfway through a task and one that does not. For anyone running multi-step agent workflows in production, this changes which tasks you can actually delegate.

**Quality Gate:** PASS (3/3) - Builder's Aside pattern. Connects benchmark to operational reality.

---

**TARGET 3: KILLED EXAMPLE - Generic AI Hype**

**Original Post:** Viral post about "AI is going to change everything" with 50K+ likes.

**Score: 33/80** - KILLED
- Territory Fit: 3/10 (2x) = 6
- Conversation Opportunity: 2/10 (2x) = 4
- Account Quality: 8/10 = 8
- Post Freshness: 5/10 = 5
- Reply Visibility: 2/10 = 2
- Multi-Signal: 8/10 = 8

**Kill rationale:** Territory fit is too broad (generic AI, no commerce/operations angle). Conversation opportunity is zero because the reply section is already flooded with hundreds of generic takes. Reply visibility at 2/10 - your reply would be buried. High follower count on the poster does not compensate for the fact that adding a substantive reply to a post with 800+ replies is a wasted signal.

---

**TARGET 4: Agent-to-Agent Communication Protocols**

**Original Post:** Discussion of emerging standards for how AI agents communicate with each other in multi-agent systems.

**Score: 62/80**
- Territory Fit: 8/10 (2x) = 16
- Conversation Opportunity: 8/10 (2x) = 16
- Account Quality: 7/10 = 7
- Post Freshness: 7/10 = 7
- Reply Visibility: 8/10 = 8
- Multi-Signal: 8/10 = 8

**Drafted Reply:**
> The protocol question for agent-to-agent communication is the same question we had to answer for agent-to-merchant communication. Who arbitrates when Agent A says "this product is good" and Agent B says "no it is not"? You need a verification layer that both agents trust. Without it, agent-to-agent commerce is just two hallucination machines agreeing with each other.

**Quality Gate:** PASS (3/3) - Contextual Wedge pattern ("Right, but the part nobody's talking about is..."). Gift: the reader sees that verification is the missing primitive in multi-agent architectures.

---

### Slack-to-X Pipeline: Sample Transform

**Source:** Your #productai message from February 11, 2026:

> "Our Product.ai API / MCP strategy just got a agentic payment rail with Stripe / Base / USDC announcement today."
>
> Thread follow-up: "And a wallet now, all the building blocks are now available"
>
> Thread follow-up: "Product.ai will have arguably the highest consumer utility in the digital assets space around 2028. It's where safe mode makes a massive difference."

**Score: 63/80** (PASS)
- Insight Sharpness: 9/10 (2x) = 18
- Outsider Legibility: 7/10 (2x) = 14
- Timeliness: 6/10 = 6
- Territory Fit: 10/10 = 10
- Now/Near/Far Alignment: 9/10 = 9
- Sensitivity Risk: 6/10 = 6

**Sensitivity items caught and stripped:**
- "Product.ai API / MCP strategy" (internal strategy reference)
- "VaaS" (internal term)
- "Safe Mode" (internal product feature)
- Team member names
- "2028" timeline prediction
- Canvas contained: Nexus S2S, Kill Shot, Offering Matrix (all stripped)

**Now/Near/Far Mapping:**
- **Now:** Stripe x402 launch - machine-to-machine payments for AI agents
- **Near:** Payment rail solved, but nobody is building the verification layer for the data agents will pay for
- **Far:** (Implicit) The next infrastructure layer of the agent economy is trust architecture, not more payment rails

**The Transform:**

Your Slack message (inside-out, internal context):
> "Our Product.ai API / MCP strategy just got a agentic payment rail..."

Became (outside-in, public-facing):

> Stripe x402 gives AI agents a credit card. Nobody gave them a fraud detector.
>
> Everyone is celebrating machine-to-machine payments. Agents can now autonomously pay for API calls, MCP tools, product data. The payment rail is solved.
>
> But when your agent pays $0.01 for a product recommendation, who verified that recommendation is true? When it buys data from a commerce API, who pressure-tested that data against reality?
>
> The payment infrastructure for the agent economy just shipped. The trust infrastructure has not. That is the actual bottleneck - and the actual opportunity.

**Character count:** 531
**Quality Gate:** 8/10 - All 5 gates passed
**Format:** Single post. Link to Stripe x402 announcement in first reply.

---

## Your Controls

**Every piece of content requires your explicit approval.** Nothing autopublishes.

### Emoji Approval System
- ✅ = Post as-is
- ✏️ = You edit in thread, system posts your version
- ❌ = Kill (do not post)
- ⏸️ = Hold for better timing

### What You Can Adjust
- Daily brief cadence and delivery time
- Number of reply targets per day (currently 8-12)
- Channels scanned for Slack-to-X (currently all public channels via your Slack user ID - catches insights wherever you drop them)
- Scoring sensitivity (we can tighten or loosen the 48/80 cutoff)

### Escalation Triggers (These Always Get Flagged)
- Comments naming specific competitors negatively
- Claims about Demand.io/Product.ai revenue, metrics, or unreleased features
- Replies to journalists or media accounts
- Any comment longer than 4 sentences

---

## The Voice Guardrails

This system sounds like you because it is grounded in your actual language patterns. Not marketing copy. Not ghostwriter voice. Your voice, extracted from your Slack, your meetings, your published writing.

### Your Comment Patterns (What the System Uses)
- **The Reframe:** "This is actually a [mechanism] problem, not a [surface] problem."
- **The Binary Reduction:** Compress a complex situation to a simple primitive.
- **The Contextual Wedge:** Accept a claim, name what it misses.
- **The Builder's Aside:** Drop a specific operational detail that signals building.
- **The Short Punch:** Under 15 words. Definitive.
- **The Contrarian Redirect:** Break the frame respectfully.

### God Terms (Used Freely)
Friction, Native, Protocol, Utility, Physics, Engine, Signal, Noise, Moat, Axiom, Mechanic, Verification, Ground truth, Deterministic, Probabilistic, Architecture, Infrastructure, Boring

### Banned Terms (Never Used)
Delve, Landscape, Tapestry, Foster, Unlock, Holistic, Synergistic, Exciting, Revolutionize, Love this, Great point, So true, Couldn't agree more, This is huge, Amazing

### Style Rules
- No em dashes (hyphens only)
- No passive voice
- No exclamation marks
- No emoji in posts
- Every paragraph scannable in 2 seconds on phone

---

## What We Are Asking

1. **Review this document.** Mark up anything that feels off - voice, tone, strategy, sample outputs, the approval flow.
2. **Run a 1-week live trial.** You receive daily briefs and give us real feedback on what sounds like you, what does not, and what targets are worth your time.
3. **Flag any draft that misses.** Every miss calibrates the system. The scoring engine and voice profile get sharper with your feedback.

---

## The Architecture (For Reference)

The intelligence layer (scouting, scoring, drafting, quality gating) runs in Claude Code with full access to Slack, WebSearch, and your grounding files. Moltbot handles only delivery (posting the brief to your DM) and execution (posting approved replies/posts to X via the existing upload-post skill). Moltbot does not run any of the content intelligence.

**Provenance:**
- Strategic Brief v2 (Feb 18, 2026) - The direction
- ARC Axioms v2.0 (Feb 18, 2026) - The algorithm physics
- Social Post Playbook v1.0 - The writing standards
- Voice Encoder (11 axioms) - Your voice profile
- Ghost Engine v2 Build (12 new files) - The execution layer

---

## Recommended Next Steps

Pending your approval, here is the build-to-live sequence. Each phase has a clear gate before the next one starts.

### Phase 1: Review and Calibrate (This Week)

- [ ] Mike reviews this document and flags anything that feels off (voice, tone, strategy, sample outputs, approval flow)
- [ ] Dakota incorporates feedback into the grounding file and scoring rubrics
- [ ] Dakota runs 2-3 additional single-day prototype tests on recent dates to validate consistency across different news cycles (quiet days, heavy days, weekends)

**Gate:** Mike confirms the prototype outputs are directionally right and the voice is close enough to trial.

### Phase 2: Manual Live Trial (1 Week)

- [ ] Dakota runs the Reply Engine manually each morning in Claude Code (~10 min)
- [ ] Daily brief delivered to Mike's Slack DM (Dakota posts manually during trial)
- [ ] Mike reviews targets, gives feedback: which drafts sound like him, which do not, which targets were worth his time, which were not
- [ ] Dakota runs the Slack-to-X Pipeline on-demand when high-signal messages surface
- [ ] Dakota logs every approval, rejection, and edit in a calibration tracker
- [ ] End-of-week calibration session: adjust scoring weights, voice patterns, and territory boundaries based on Mike's feedback

**Gate:** Mike confirms the system is calibrated enough to automate delivery. Kill rate, voice accuracy, and target quality meet his bar.

### Phase 3: Moltbot Integration (Dylan, ~1 Day Build)

- [ ] Confirm Moltbot's upload-post skill supports `in_reply_to_tweet_id` for programmatic replies on X (not just original posts)
- [ ] Build a Moltbot skill that triggers a Claude Code session with pre-approved tool permissions (Slack MCP read, WebSearch, file read/write) so no manual "Allow" clicks are needed
- [ ] Set up Moltbot cron: daily 6 AM PT trigger that spawns the Claude Code Reply Engine run
- [ ] Build the Slack DM delivery skill: takes Claude Code output, formats the daily brief, posts to Mike's DM with emoji reaction listeners (checkmark = post, pencil = edit, X = kill, pause = hold)
- [ ] Build the posting skill: when Mike reacts with checkmark, Moltbot posts the reply to X via upload-post; when Mike reacts with pencil, Moltbot listens for his edited version in thread, then posts that instead
- [ ] Wire the Slack-to-X Pipeline into the same delivery and approval pattern

**Gate:** Full end-to-end test. Cron fires, Claude Code runs unattended, brief lands in Mike's DM, emoji approval triggers X post. No human in the loop except Mike's approval tap.

### Phase 4: Live Automated Operation (Ongoing)

- [ ] Reply Engine runs daily at 6 AM PT, brief lands in Mike's DM by 6:15 AM
- [ ] Slack-to-X Pipeline scans Mike's Slack activity daily, surfaces high-scoring messages for approval
- [ ] Dakota monitors weekly metrics: reply engagement rates, profile visit lift, follower growth trajectory, scoring accuracy (approved vs. killed ratio)
- [ ] Monthly calibration: adjust scoring weights, add/remove tracked accounts, tune territory boundaries based on what is performing
- [ ] Scoring engine sharpens over time as Mike's approval patterns train the system

### Phase 5: Measurement and Iteration (Month 2+)

- [ ] Baseline metrics captured during Week 1 of automated operation
- [ ] A/B comparison: weeks with Reply Engine active vs. baseline posting cadence
- [ ] Track: impressions per reply, profile visits per day, follower growth rate, reply-to-follow conversion, best-performing reply patterns, best-performing topic areas
- [ ] Adjust content mix ratios based on data (currently 60-70% replies, may shift as follower count grows per Axiom 3.4)
- [ ] Evaluate when to shift from Growth Phase to Breakout Phase content allocation

---

**END OF BRIEF**
