# X Engine - Visual Grounding Document for Nano Banana Illustrations

**Purpose:** This document provides everything needed to create detailed, accurate Nano Banana-style illustrations explaining the X Engine - a prompt-driven content strategy system for X/Twitter. The audience for these illustrations is a cold audience at a demos meeting who has never seen this system before.

**Target illustrator:** Gemini (for Nano Banana illustration generation)

**Key framing:** This is an AI-powered content pipeline that turns one person's internal company Slack messages and the live X/Twitter ecosystem into high-quality public posts and replies - without that person having to spend hours scrolling X or drafting content from scratch. The human always approves before anything publishes. Think of it as a content intelligence system, not a content automation system.

---

## THE BIG PICTURE

The X Engine has two independent systems that solve two different problems:

**System 1: The Reply Engine** - "Find the right conversations and help Mike join them."
- Runs daily (morning)
- Scans the X/Twitter ecosystem for high-value posts Mike should reply to
- Drafts suggested replies in Mike's actual voice
- Delivers a daily brief with 10-15 scored targets
- Mike reviews on his phone, approves/edits/skips each one
- Total daily time for Mike: ~30 minutes

**System 2: The Slack-to-X Pipeline** - "Turn Mike's internal insights into public posts."
- Runs on-demand or as a daily scan
- Scans Mike's Slack messages across all company channels
- Identifies messages that contain public-worthy insights
- Transforms them from internal (team-facing) to external (audience-facing)
- Strips all sensitive company information automatically
- Mike reviews and approves before anything posts

**Who is Mike?** Mike Quoc is a CEO/founder in the AI commerce space (~6,000 X followers). At this follower size, replying to larger accounts' posts is the primary growth lever - not broadcasting original posts. The Reply Engine exploits this algorithm physics.

**Who is Dakota?** Dakota Nunley is the operator who runs the pipeline daily. Dakota triggers the system, reviews the output for quality, and routes the final brief to Mike.

---

## SYSTEM 1: THE REPLY ENGINE (4 Stages)

### Visual Flow (illustrate this as a pipeline/funnel):

```
[Slack Channels] + [X/Twitter API] + [WebSearch]
         |                |               |
         v                v               v
   ┌─────────────────────────────────┐
   │  STAGE 1: SCOUT                 │
   │  "Cast the widest net"          │
   │                                 │
   │  Input: 3 data sources          │
   │  Output: 30-50 raw candidates   │
   └──────────────┬──────────────────┘
                  │
                  v
   ┌─────────────────────────────────┐
   │  STAGE 2: SCORE                 │
   │  "Be ruthless"                  │
   │                                 │
   │  6-dimension scoring engine     │
   │  Hard cutoff: 48/80             │
   │  ~64% kill rate                 │
   │  Output: Top 10-15 survivors    │
   └──────────────┬──────────────────┘
                  │
                  v
   ┌─────────────────────────────────┐
   │  STAGE 3: DRAFT                 │
   │  "Sound like Mike"              │
   │                                 │
   │  Draft 1 reply per target       │
   │  Uses Mike's voice patterns     │
   │  Quality gate: 4 checks         │
   │  Output: Ready-to-post replies  │
   └──────────────┬──────────────────┘
                  │
                  v
   ┌─────────────────────────────────┐
   │  STAGE 4: DELIVER               │
   │  "Brief lands on Mike's phone"  │
   │                                 │
   │  Two-part daily brief:          │
   │  Part 1: Full audit (Dakota)    │
   │  Part 2: Action items (Mike)    │
   │  Output: Slack DM + Notion doc  │
   └─────────────────────────────────┘
```

### Stage 1: SCOUT - Detail

**What it does:** Finds 30-50 X/Twitter posts that Mike could reply to today.

**Three data sources (illustrate as three input streams merging):**

1. **Slack Signal (highest priority)** - Checks Mike's Slack messages from the past 24 hours across 5 channels (#ai-news, #productai, #ai-agents, #ai-dev, #ai-prompting). This reveals what Mike is already thinking about today. Output: 3-8 topics.

2. **X Zeitgeist Discovery (via X Twitter MCP API)** - Searches X for what the AI ecosystem is talking about right now. Runs broad discovery queries first, then territory-specific searches. Uses the X API as the primary tool, with WebSearch as a fallback if the API hits rate limits.

3. **Tracked Accounts (supplemental)** - Checks a curated list of Tier 1 accounts in the AI/tech space for recent high-engagement posts.

**Key visual concept:** The best reply targets sit at the INTERSECTION of what Mike is thinking about (Slack) AND what X is talking about (API/search). Illustrate this as a Venn diagram or overlap zone.

**Data Confidence Protocol (important detail):**
- Data from the X API is labeled **VERIFIED** (exact follower counts, exact engagement numbers, full post text)
- Data from WebSearch fallback is labeled **ESTIMATED** (approximate numbers, possibly truncated text)
- This label follows every data point through the entire pipeline

**Deduplication:** Before collecting anything, the scout checks the last 3 days of output. Any post URL that appeared in a previous brief is dead - never re-collected.

**Timestamp validation:** Every candidate's publish date is verified using X's Snowflake ID decoder (a mathematical computation on the tweet's numeric ID). No post older than 7 days is collected. This is mandatory because search results cannot be trusted for recency.

### Stage 2: SCORE - Detail

**What it does:** Scores every candidate on 6 weighted dimensions. Kills anything below 48/80.

**The 6 Dimensions (illustrate as a scoring rubric or radar chart):**

| Dimension | Weight | What It Measures |
|-----------|--------|-----------------|
| Territory Fit | 2x | Is this in Mike's lane? (AI commerce, agents in production, trust/verification, operational AI) |
| Conversation Opportunity | 2x | Is there a gap in the replies that Mike can fill? |
| Account Quality | 1x | Is the poster's audience the right audience? (10K-500K followers, active AI/tech community) |
| Post Freshness | 1x | How old is the post? (Under 6 hours = best, over 24 hours = low priority) |
| Reply Visibility | 1x | Will Mike's reply actually be seen? (5-50 existing replies = ideal, 100+ = buried) |
| Multi-Signal Potential | 1x | Does this connect to something Mike said in Slack today? |

**Formula:** Total = (Territory x 2) + (Opportunity x 2) + Account + Fresh + Visibility + Multi-Signal = max 80

**Hard cutoff at 48/80 (60%).** If only 5 targets pass, surface 5. Never inflate scores to hit a target count.

**Data Confidence Adjustment:** If data came from WebSearch (ESTIMATED), the score gets penalized: -2 for estimated data, -3 for truncated post text, max -5 stacked. This prevents the system from being overconfident about data it doesn't actually have.

**Typical kill rate: ~64%.** Most candidates don't survive. This is the quality gate that protects Mike's time.

### Stage 3: DRAFT - Detail

**What it does:** Drafts one reply per surviving target in Mike's actual voice.

**Step 0: Source Material Validation** - If the original post references an article, paper, or announcement, the system tries to fetch and read it first. Labels: VALIDATED (read it), PARTIAL (only got summary), UNVALIDATED (couldn't retrieve), N/A (no source referenced). This prevents Mike from replying to something based on a misreading.

**Mike's 6 Comment Voice Patterns (illustrate these as distinct reply "shapes"):**

1. **The Reframe** - "This is actually a [mechanism] problem, not a [surface] problem."
2. **The Binary Reduction** - Compress a complex situation to a simple primitive.
3. **The Contextual Wedge** - Accept a claim, then name what it misses.
4. **The Builder's Aside** - Drop a specific operational detail that signals "I build things."
5. **The Short Punch** - Under 15 words. Definitive.
6. **The Contrarian Redirect** - Break the frame respectfully.

**Voice rules:**
- Always active voice (never passive)
- 1-4 sentences max
- No em dashes (hyphens only)
- No emoji, no exclamation marks
- Uses "God Terms" (Friction, Native, Protocol, Utility, Physics, Engine, Signal, Verification, Ground truth, Architecture, Infrastructure)
- Never uses "Banned Terms" (Delve, Landscape, Tapestry, Foster, Unlock, Holistic, Synergistic, etc.)

**Quality Gate for Replies (4 checks):**
- Gate 1 (Scroll Test): Would someone in the reply thread stop and pay attention?
- Gate 2 (Voice Test): Does this sound like Mike talking to a peer?
- Gate 3 (Gift Test): Does the reader walk away with something concrete and specific?
- Gate 3b (Outside-In Check): Is the first sentence about the reader's world, not Mike's?
- Gate 4 (Monotony Test - brief-level): Are the replies collectively diverse in pattern, gift, and topic? No single pattern used more than twice. No single sub-territory more than 40%.

### Stage 4: DELIVER - Detail

**What it does:** Formats the output into a two-part daily brief.

**Part 1: The Scouting (for Dakota)**
- Full candidate inventory with scores
- Every pass/kill decision with rationale
- Data confidence baseline (were most targets VERIFIED via API or ESTIMATED via WebSearch?)
- Territory distribution, freshness distribution, account size distribution
- Complete audit trail - every decision is traceable

**Part 2: The Targets (for Mike)**
- 10-15 reply targets, each self-contained
- Each target includes: the original post (with link), why it's worth replying to, a suggested reply draft, the voice pattern used, and the "gift" the reader gets
- Scannable from phone
- Mike picks targets, edits or rewrites drafts, and posts

---

## SYSTEM 2: THE SLACK-TO-X PIPELINE (4 Stages)

### Visual Flow (illustrate as a transformation pipeline):

```
Mike's Slack Message (internal, team-facing)
         │
         v
   ┌─────────────────────────────────┐
   │  STAGE 1: FLAG                  │
   │  "Identify the signal"          │
   │                                 │
   │  Dakota provides message +      │
   │  context + speed mode           │
   │  OR: automated daily scan finds │
   │  it across ALL Slack channels   │
   └──────────────┬──────────────────┘
                  │
                  v
   ┌─────────────────────────────────┐
   │  STAGE 2: SCORE                 │
   │  "Is this worth posting?"       │
   │                                 │
   │  6-dimension scoring engine     │
   │  Hard cutoff: 48/80             │
   │  Output: PASS or KILL           │
   └──────────────┬──────────────────┘
                  │
                  v
   ┌─────────────────────────────────┐
   │  STAGE 3: TRANSFORM             │
   │  "Flip inside-out to            │
   │   outside-in"                   │
   │                                 │
   │  6-step transformation          │
   │  Sensitivity screen             │
   │  7-gate quality check           │
   │  Output: Ready-to-post X post   │
   └──────────────┬──────────────────┘
                  │
                  v
   ┌─────────────────────────────────┐
   │  STAGE 4: APPROVE               │
   │  "Mike decides"                 │
   │                                 │
   │  Original + transformed shown   │
   │  Mike: Approve / Kill / Hold    │
   │  Nothing publishes without      │
   │  explicit approval              │
   └─────────────────────────────────┘
```

### Stage 2: SCORE (Slack-to-X) - Detail

**Different scoring dimensions than the Reply Engine.** This scores the MESSAGE, not a target post.

| Dimension | Weight | What It Measures |
|-----------|--------|-----------------|
| Insight Sharpness | 2x | Is there a non-obvious insight the public would care about? |
| Outsider Legibility | 2x | Can someone outside the company understand this? |
| Timeliness | 1x | Is there a time-sensitive window? |
| Territory Fit | 1x | Does this map to Mike's semantic territory? |
| Now/Near/Far Alignment | 1x | Can this map to the content formula? (explained below) |
| Sensitivity Risk | 1x (inverse) | What is the information leakage risk? Higher score = lower risk. |

**Same cutoff: 48/80.** Below that = killed with explanation.

### Stage 3: TRANSFORM - Detail

**This is the creative core of System 2.** It takes an internal message and flips it for a public audience.

**The Key Concept: Inside-Out to Outside-In (important to illustrate)**

Slack messages are naturally "inside-out" - Mike is talking to his team, using internal context, referencing company projects. The transform flips it "outside-in" - starting from the READER'S world, pulling them into Mike's insight. The reader has zero context about the company's internal conversation.

**Visual example of the flip:**

BEFORE (Inside-Out / Slack):
> "Our Product.ai API / MCP strategy just got an agentic payment rail with Stripe / Base / USDC announcement today."

AFTER (Outside-In / X Post):
> "Stripe x402 gives AI agents a credit card. Nobody gave them a fraud detector.
>
> Everyone is celebrating machine-to-machine payments. Agents can now autonomously pay for API calls, MCP tools, product data. The payment rail is solved.
>
> But when your agent pays $0.01 for a product recommendation, who verified that recommendation is true? When it buys data from a commerce API, who pressure-tested that data against reality?
>
> The payment infrastructure for the agent economy just shipped. The trust infrastructure has not. That is the actual bottleneck - and the actual opportunity."

**The Now/Near/Far Formula (illustrate as three layers):**
- **The Now:** What current event or conversation does this enter? (The reader must recognize this from their own feed.)
- **The Near:** What is the non-obvious implication? (This is usually the core of Mike's insight.)
- **The Far:** What deeper truth does this point toward? (Stays implicit. Never stated directly. Let the reader sense the depth.)

**The Context Pyramid (illustrate as three layers):**
- **Layer 1 (Bedrock):** Mike's core axioms and positioning. Never changes. Lives in the grounding files.
- **Layer 2 (Hardened Clay):** Thematic currents - what Mike has been obsessing over for 30-60 days. Updated bi-weekly via a Thematic Scan.
- **Layer 3 (Wet Clay):** Today's moment. The news, the viral thread, the announcement. This is what the Slack message is usually reacting to.

The best posts connect all three layers.

**6-Step Transformation Protocol:**
1. Extract the core insight (the "One Nail")
2. Map to Now/Near/Far
3. Flip outside-in (most important step)
4. Apply writing principles (hook inversion, active voice, sentence rhythm, gift test)
5. Format for X (200-600 chars, no links in body, no em dashes, no emoji)
6. Run 7-gate quality check

**Sensitivity Screen (critical - illustrate as a filter/shield):**
The system automatically catches and strips:
- Customer names
- Revenue figures
- Unreleased product details
- Internal project codenames
- Competitor strategy discussions
- Team performance data
- Legal or partnership details

When in doubt, it flags for Dakota to review manually.

**Quality Gate for Posts (7 gates - more rigorous than replies):**
1. Scroll Test - Does the opening hook attention?
2. Gift Test - Does the reader walk away with a framework-level insight? (Higher bar than replies - must be reusable, not just an observation.)
3. Voice Test - Is it sharp, active, and in Mike's voice?
4. Throughline Test - Is there one clear idea? (One Nail Rule)
5. Follow Test - Would reading this make someone want to follow @michaelquoc specifically?
6. Outside-In Test - Does the first sentence center the reader's problem?
7. Outsider Legibility Test - Would a stranger in the AI/tech space understand every word without knowing who Mike is or what he builds?

---

## THE TECHNOLOGY STACK (How It Actually Runs)

**Illustrate as a system architecture diagram:**

```
┌──────────────────────────────────────────────────┐
│                   CLAUDE CODE                     │
│          (The AI brain - runs everything)         │
│                                                   │
│  Reads prompt files → Executes pipeline stages    │
│  → Scores → Drafts → Formats → Delivers          │
└──────────────────┬───────────────────────────────┘
                   │
          ┌────────┼────────┐
          │        │        │
          v        v        v
    ┌──────────┐ ┌──────────┐ ┌──────────────┐
    │ Slack    │ │ X Twitter│ │  WebSearch   │
    │ MCP      │ │ MCP      │ │  (fallback)  │
    │          │ │          │ │              │
    │ Reads    │ │ Searches │ │ Searches web │
    │ Mike's   │ │ X posts  │ │ when API     │
    │ messages │ │ via API  │ │ is down      │
    └──────────┘ └──────────┘ └──────────────┘
```

**Key technology concepts for the illustration:**

- **MCP (Model Context Protocol):** Think of these as "bridges" that let Claude Code talk directly to external services (Slack, X/Twitter). Like plugins for an AI.
- **X Twitter MCP** is the PRIMARY data source for X posts. It provides exact, verified data (follower counts, engagement metrics, full post text).
- **WebSearch** is the FALLBACK. Used when the API is unavailable or rate-limited. Provides estimated data.
- **Prompt files** are the instructions. The entire system runs on markdown files that tell Claude Code exactly what to do at each stage. No traditional code - just structured prompts.
- **Grounding files** define Mike's voice, his semantic territory, banned terms, quality standards. These are loaded before every run.

---

## MIKE'S SEMANTIC TERRITORY (What He Posts About)

**Illustrate as a territory map or zones:**

**Core territory (dead center):**
- AI Commerce - agents buying, selling, verifying products
- Agents in Production - failure modes, fleet management, the gap between AI demos and reality
- Trust/Verification - verification architecture, ground truth, accountability

**Adjacent territory:**
- Agent Economics - compute costs, unit economics of agent-driven workflows
- Operational AI at Scale - infrastructure, monitoring, what breaks at scale
- Model Capabilities (Operational Lens) - what new model releases mean for production systems, not benchmarks

**Off-territory (avoid):**
- Generic AI hype
- Consumer AI enthusiasm
- Crypto speculation
- AI art
- Political AI takes

**Why territory matters:** X's algorithm builds an "embedding gravity well" - each on-topic post strengthens the association between Mike's profile and the AI commerce niche. Every off-topic post dilutes it. Consistency compounds over time.

---

## THE APPROVAL FLOW (Nothing Publishes Without Mike)

**Illustrate as a simple decision tree:**

```
Daily Brief lands in Mike's Slack DM
         │
         v
Mike reviews each target on his phone
         │
    ┌────┼────┬────┐
    │    │    │    │
    v    v    v    v
   ✅   ✏️   ❌   ⏸️
  Post  Edit  Kill  Hold
  as-is  in   this  for
        thread       later
```

**Time investment:**
- Reply Engine review: ~30 minutes/day across 2-3 sessions
- Slack-to-X approval: ~2 minutes per post
- Everything else is automated

---

## KEY METRICS AND NUMBERS FOR ILLUSTRATIONS

- 30-50 candidates scouted per daily run
- ~64% kill rate at scoring (the engine has taste)
- 10-15 targets survive to the daily brief
- 48/80 hard scoring cutoff (60%)
- 6 scoring dimensions per system
- 4 quality gates for replies, 7 for posts
- 6 voice patterns Mike uses
- 1-4 sentences per reply (never longer)
- 200-600 characters per post
- ~30 minutes total daily time for Mike
- 5 Slack channels monitored (plus full workspace scan for daily Slack scans)

---

## SUGGESTED ILLUSTRATION CONCEPTS

1. **The Two-System Overview** - A split illustration showing both systems side by side with their flows, connected by the shared grounding (Mike's voice profile) at the center.

2. **The Reply Engine Funnel** - 50 candidates enter the top, the scoring stage kills most of them, 10-15 emerge at the bottom with draft replies attached. Show the 64% kill rate visually.

3. **The Inside-Out to Outside-In Flip** - The single most important concept in System 2. Show the same insight being flipped from internal framing to public framing. The Slack message on the left (messy, internal references, team context) transforms into the X post on the right (clean, reader-first, universally understandable).

4. **The Scoring Radar Chart** - Show the 6 dimensions for either system as a radar/spider chart. Show a "passing" candidate (high scores, above 48) vs a "killed" candidate (low scores, below cutoff).

5. **The Data Source Cascade** - X Twitter MCP (primary, verified) → WebSearch (fallback, estimated) → Manual input from Dakota (emergency). Show the confidence labels flowing through the pipeline.

6. **Mike's Daily Experience** - Phone mockup showing Mike scanning the daily brief in his Slack DM. Quick decision on each target. Total time: 30 minutes.

7. **The Sensitivity Shield** - Show internal Slack message with sensitive items highlighted (customer names, revenue, codenames), then the shield stripping them out, producing a clean public post.

8. **The Territory Map** - Mike's semantic territory as concentric circles or zones. Core in the center, adjacent around it, off-territory outside the border.

---

## GLOSSARY FOR ILLUSTRATIONS

- **MCP** = Model Context Protocol. Bridges that let AI tools talk to external services.
- **VERIFIED / ESTIMATED** = Data confidence labels. API data is verified (exact). WebSearch data is estimated (approximate).
- **The Gift Principle** = Every piece of content must deliver concrete value to the reader. No empty agreement or surface commentary.
- **The One Nail Rule** = Each post makes one clear point. Not two. Not three. One.
- **Now/Near/Far** = Content formula. Now (what's happening), Near (the non-obvious implication), Far (the deeper truth, left implicit).
- **Territory Lock** = Every piece of content must map to Mike's semantic territory. Off-territory posts dilute his algorithm positioning.
- **Snowflake ID** = X/Twitter's numeric post ID that encodes the exact publication timestamp. Used to verify post freshness when search results can't be trusted for recency.
- **Embedding Gravity Well** = The algorithm effect where consistent on-topic posting strengthens the association between a profile and a niche, making future posts more likely to surface to the right audience.
- **God Terms** = Words Mike uses freely (Friction, Protocol, Verification, Architecture, etc.)
- **Banned Terms** = Words the system never uses (Delve, Landscape, Synergy, etc.)
- **Thematic Currents** = Themes Mike has returned to 3+ times over 30-60 days. Layer 2 of the Context Pyramid. Updated bi-weekly.

---

**END OF GROUNDING DOCUMENT**
