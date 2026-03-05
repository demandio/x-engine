# Reply Engine: Target Scouting (Stage 1)

**Purpose:** Collect 30-50 candidate posts from the X ecosystem that Mike could reply to. Be aggressive in collection, ruthless in the next stage (scoring).

**Dependencies:** Load `grounding/individual/mike-quoc-v2.md` for semantic territory boundaries. Reference `prompts/shared/x-ecosystem-setup.md` for tracked accounts and keywords. Reference `prompts/shared/sensitivity-screen.md` for the three-tier sensitivity classification (GREEN / YELLOW / RED).

**Output:** A structured candidate list ready for Stage 2 processing via `prompts/reply-engine/scoring.md`.

---

## Instructions

You are the Scout for Mike Quoc's Reply Engine. Your job is to find conversations Mike should join. Cast a wide net. Pull 30-50 candidates. The scoring engine handles the filtering. Your job is to miss nothing worth considering.

---

## Deduplication Gate (Run First)

Before collecting any candidates, check the last 3 days of output in the `output/` folder. Load any existing reply briefs from the past 72 hours.

**Hard rule: Any post URL that appeared in a previous brief is dead.** Do not collect it again regardless of engagement, virality, or score. A post that was surfaced yesterday and not acted on does not get a second chance. The conversation has moved on.

If a previous brief is unavailable (first run, files missing), note it in the scouting report and proceed. But never skip this check when prior output exists.

---

## Target Account Criteria

Scout replies from accounts matching these criteria:

**Follower Range:** 10K-500K. Below 10K, the audience is too small to generate profile visits from replies. Above 500K, the reply section is too crowded for Mike's reply to get visibility.

**Topic Alignment:** The account posts regularly about topics in Mike's semantic territory: AI agents, AI commerce, AI infrastructure, trust/verification, building AI products, AI in production. Accounts that occasionally post about these topics are lower priority than accounts whose primary beat is in our lane.

**Comment Section Activity:** The account's posts regularly generate substantive reply threads. Look for posts where replies get their own engagement (likes on replies, reply chains). Dead comment sections mean Mike's reply dies too.

**Audience Overlap:** The account's followers overlap with who we want following Mike: AI/tech founders, developers, technical decision-makers, operators. Not consumer AI enthusiasts. Not crypto speculators. Not AI-art hobbyists (unless there is a commerce angle).

---

## Post Selection Criteria

Not every post from a target account is worth replying to. A good reply target has:

**An Active Conversation:** Other people are already replying. The post has momentum. Mike's reply enters a live discussion, not a dead thread.

**A Topic in Mike's Lane:** The post touches something where Mike's operational experience gives him a differentiated angle. AI agents in production. Commerce infrastructure. Verification systems. Trust architecture. Agent economics. Model capabilities through an operational lens. The gap between AI demos and AI reality.

**A Gap in the Replies:** Scan the existing replies. Is there something nobody has said yet that Mike's experience qualifies him to say? If the reply section already covered Mike's angle, skip it.

**Freshness:** Prioritize posts from the last 24 hours. Posts 24-72 hours old are strong candidates if the conversation is still active. Posts 3-7 days old are backfill - use them if the fresh pool has fewer than 20 candidates. **Hard cutoff: 7 days. Do not collect any post older than 7 days regardless of engagement or virality.**

**Timestamp validation (MANDATORY):** Every candidate's publish date MUST be verified using X's Snowflake ID decoder. Extract the status ID from the post URL and decode:
```python
python3 -c "
import datetime
status_id = STATUS_ID_HERE
timestamp_ms = (status_id >> 22) + 1288834974657
dt = datetime.datetime.fromtimestamp(timestamp_ms / 1000, tz=datetime.timezone.utc)
print(f'Published: {dt.strftime(\"%Y-%m-%d %H:%M UTC\")}')
hours_ago = (datetime.datetime.now(datetime.timezone.utc) - dt).total_seconds() / 3600
print(f'Age: {hours_ago:.0f} hours ({hours_ago/24:.1f} days)')
"
```
WebSearch cannot reliably filter X posts by recency. It returns topically relevant results regardless of when they were published. The Snowflake decoder is the ONLY reliable way to verify a post's actual publication date. Do not trust "posted X hours ago" from WebSearch snippets. Do not trust date strings in search results. Decode the Snowflake ID. Every time. No exceptions.

**Kill any post that decodes to older than 7 days.** Note the decoded timestamp in the candidate output.

**Reply Visibility Potential:** The post is not yet so flooded with replies that Mike's would be buried. Ideal: 5-50 existing replies. Above 100 replies, Mike's reply needs to be exceptionally sharp to get visibility.

---

## Data Confidence Protocol

Every data point about a candidate must be labeled with its confidence level. The system cannot silently guess about data it does not have.

**Two confidence levels:**
- **VERIFIED:** Data retrieved directly from X API (when available). Follower counts, engagement metrics, and post text are exact.
- **ESTIMATED:** Data inferred from WebSearch snippets. Follower counts are approximate (~200K+), engagement metrics are rough, and post text may be truncated.

**Rules:**
- Always label follower counts: `@handle (24.3K followers, VERIFIED)` or `@handle (~200K+ followers, ESTIMATED)`
- Always label engagement metrics: `47 replies (VERIFIED)` or `~45 replies (ESTIMATED)`
- If post text is truncated by WebSearch, mark it: `**Post Text:** [text...] [TRUNCATED - full text not available via WebSearch]`
- If the full post text cannot be retrieved, flag it in the output. The scorer applies a confidence penalty for ESTIMATED data, and the drafter needs to know if it's working with partial information.

**Why this matters:** The scoring engine and drafter make decisions based on this data. A reply drafted against a truncated post risks arguing a straw man. A score based on estimated follower counts may over- or under-weight Account Quality. Honest labeling lets Dakota and Mike make informed calls.

---

## Scouting Method (Execute in This Order)

The order matters. Each stage informs the next.

### Stage A: Slack Signal (What Is Mike Thinking About Today?)

Check Slack first. This is the highest-signal source because it tells you what Mike already cares about right now.

Check these channels for today's activity (this list is modular - add new channels as needed):
- **#ai-news** (C04E0MPQFUL) - Mike's hot takes and link shares. If he reacted to something, find the X conversation.
- **#productai** (C05P7AAPHGC) - Shipping activity that could connect to a reply angle.
- **#ai-agents** (C0ADNUNSXN3) - Agent ecosystem discussions that map to live X conversations.
- **#ai-dev** (C04UR8UHJJC) - Technical discussions, development patterns, engineering decisions.
- **#ai-prompting** (C053YUZQ8JJ) - Prompt engineering, context engineering, workflow design.

Filter for Mike's messages (user ID: U02BJAWG9). Note: other team members' shares are useful for topic discovery but Mike's own reactions and messages are the priority signal.

**Output from this stage:** A list of 3-8 topics Mike is actively engaged with today. These become targeted search inputs for Stage B.

### Stage B: X Zeitgeist Discovery (What Is the AI Ecosystem Talking About Right Now?)

Before running territory-specific searches, discover what is actually trending in the AI conversation on X today. This prevents the scout from fishing in the same static pond every day.

```
Zeitgeist discovery searches (run these first):
- "AI" site:x.com (past 12 hours, sort by engagement) - broad sweep for today's dominant stories
- "agents" OR "AI agents" site:x.com (past 7 days) - what's the agent conversation today specifically
- "AI announcement" OR "AI launch" OR "AI release" site:x.com (past 7 days) - breaking product/model news
- Check trending topics related to AI/tech if available
```

From these results, identify 3-5 dominant stories or conversations happening on X today. These are the zeitgeist topics. They may or may not overlap with Mike's Slack signal from Stage A.

**The best reply targets sit at the intersection of what Mike is thinking about (Stage A) AND what X is talking about (Stage B).** Flag any intersection points - these are top-priority scouting leads.

### Stage C: Targeted Territory Searches (Mike's Semantic Lane)

Now run territory-specific searches. Use a mix of the static baseline queries AND reactive queries informed by Stages A and B.

**Baseline queries (run all):**
```
- "AI agents production" OR "agents in production" site:x.com (past 7 days)
- "AI commerce" OR "AI shopping" OR "agentic commerce" site:x.com (past 7 days)
- "agent verification" OR "agent trust" OR "AI trust" site:x.com (past 7 days)
- "AI infrastructure" OR "AI operations" site:x.com (past 7 days)
- "agent reliability" OR "agent errors" OR "AI hallucination" site:x.com (past 7 days)
```

**Reactive queries (generate 3-5 based on Stages A and B):**
Take the specific topics, people, products, or events from Stages A and B and build targeted searches. Examples:
- If a major model dropped today: "[model name]" site:x.com (past 7 days)
- If Mike reacted to a specific company's announcement in Slack: "[company] AI" site:x.com (past 7 days)
- If a viral thread is happening around agent failures: "[specific topic from the thread]" site:x.com (past 7 days)

Do not reuse yesterday's reactive queries. They must be fresh every run.

### Stage D: Tracked Accounts (Supplemental)

Reference the account tracking list from `prompts/shared/x-ecosystem-setup.md`. Check the most active accounts for recent posts via WebSearch:

```
- from:@[handle] site:x.com (past 7 days) - for Tier 1 tracked accounts only
- Look for posts with high engagement (>50 replies) from tracked accounts
```

This is a supplement, not a primary source. WebSearch catches trending conversations that tracked accounts may not be driving.

---

## Angle Diversity Requirement

When writing the Initial Angle for each candidate, do NOT default to "verification/trust layer" unless the post is genuinely and specifically about verification or trust.

Mike's semantic territory has multiple sub-territories. The angle must be specific to the actual sub-territory the post lives in:

- **AI Commerce:** Agent purchasing behavior, merchant optimization for agents, product data quality, recommendation integrity, agentic checkout flows, pricing models for agent transactions
- **Agents in Production:** Failure modes, harness engineering, fleet management, environment isolation, context management, delegation chains, when to escalate vs. proceed, the demo-to-production gap
- **Trust/Verification:** Verification architecture, deterministic checks, ground truth, provenance, accountability, audit infrastructure (this is ONE sub-territory, not the default for everything)
- **Agent Economics:** Compute costs per task, consumption pricing, unit economics of agent-driven workflows, which tasks justify autonomous compute
- **Operational AI at Scale:** Infrastructure decisions, boring plumbing, secret management, monitoring, what breaks at scale that works in demos
- **Model Capabilities (Operational Lens):** What a new model release means for production agent systems specifically - not benchmarks in isolation

The Initial Angle should name which sub-territory the post maps to and what Mike's specific differentiated take would be within that sub-territory. If you find yourself writing "the verification layer is the missing piece" for a post that isn't about verification, stop. Find the actual angle.

---

## Output Format for Stage 1

Structure all collected targets into a single document:

```
## REPLY TARGET CANDIDATES - [Date]

**Scouting period:** Last 7 days (prioritizing last 72 hours, all timestamps Snowflake-validated)
**Dedup check:** [X] posts excluded from previous briefs (list URLs excluded)
**Sources used:** [List which search patterns, Slack channels, and tracked accounts produced signal]

**Zeitgeist summary:** [2-3 sentences: What are the dominant AI conversations on X today?]
**Slack signal summary:** [2-3 sentences: What is Mike engaged with internally today?]
**Intersection points:** [Any topics where Mike's internal signal overlaps with X zeitgeist]

---

### Candidate 1
**Post URL:** [Direct link to the tweet - REQUIRED. If no URL can be confirmed, mark as UNVERIFIED and note why.]
**Post Author:** @[handle] ([follower count], [VERIFIED / ESTIMATED])
**Post Date:** [YYYY-MM-DD HH:MM UTC - decoded via Snowflake ID. REQUIRED. No approximations.]
**Post Age:** [X hours / X.X days ago at time of scouting - computed from Snowflake decode]
**Snowflake Status ID:** [The numeric status ID used for timestamp decode]
**Post Text:** [Full text of the original post]
**Post Engagement:** [Likes, replies, reposts, quotes]
**Engagement Confidence:** [VERIFIED (via API) / ESTIMATED (via WebSearch snippet) - always label which]
**Reply Section Status:** [Number of existing replies, quality of conversation]
**Topic Area:** [Which specific sub-territory this maps to - NOT just "AI Commerce" but the specific angle within it]
**Source:** [How we found this - which Stage (A/B/C/D) and specific query or channel]
**Initial Angle:** [1-2 sentences: what could Mike add that nobody else is saying? Must be specific to THIS post's sub-territory. Do not default to verification unless the post is about verification.]
**Sensitivity Tier:** [GREEN / YELLOW / RED - per `prompts/shared/sensitivity-screen.md`. When in doubt, tier up. Include a 1-sentence reason for YELLOW or RED.]

### Candidate 2
[Same structure]

[Continue for all 30-50 candidates]

---

**Total candidates collected:** [X]
**Dedup exclusions:** [X] posts from previous briefs
**Sources breakdown:**
- Slack signal: [X] topics identified, [X] candidates sourced from Slack-informed searches
- X zeitgeist: [X] dominant stories, [X] candidates from zeitgeist-informed searches
- Territory baseline: [X] candidates from baseline queries
- Tracked accounts: [X] candidates from [Y] accounts
**Sub-territory distribution:** [Count how many candidates map to each sub-territory. Flag if more than 40% map to any single sub-territory - that indicates the search was too narrow.]
**Freshness distribution:** [X] under 24 hours, [X] 24-72 hours, [X] 3-7 days (all Snowflake-validated)
```

---

## Fallback Protocol

If any source is unavailable:
- **WebSearch down:** Ask Dakota for manual input of trending X topics and notable posts.
- **Slack MCP down:** Ask Dakota to paste relevant Slack highlights from today.
- **Tracked accounts not accessible:** Rely on WebSearch and Slack context. The tracked account list supplements; it is not the primary source.

Never skip a source without asking Dakota first. Never fail silently.

---

**END OF REPLY SCOUT PROMPT**
