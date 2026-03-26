# The Antenna: X Ecosystem Monitoring — One-Time Setup

**Purpose:** Build the initial X account tracking list and keyword monitoring framework for Mike Quoc's Antenna pipeline. Run this once. Update monthly.

**Output:** A tracking list of 10-15 X accounts, a keyword monitoring list organized by pillar, and a weekly collection template.

---

## Task 1: Account Tracking List

The tracked accounts list is the Reply Engine's primary source of high-signal reply targets. A larger, well-tiered list means the pipeline never runs dry - even after dedup, rate limits, and author blocks remove candidates.

**Last updated:** 2026-03-26
**Total accounts:** 28 (10 Tier 1 + 12 Tier 2 + 6 Tier 3)
**Monthly review:** First of each month. Promote active Tier 3 accounts. Demote inactive accounts. Add accounts discovered through Viral Discovery stage.

### Tier 1: Core Monitoring (Query every run via `from:` search)

High-signal individuals. Active posters. Strong reply threads. These accounts are the backbone of every scouting run.

| Handle | Name | Followers | Primary Topics | Sub-Territory Match |
|--------|------|-----------|----------------|-------------------|
| @karpathy | Andrej Karpathy | ~2.8M | AI engineering, coding, model capabilities | Model Capabilities, Operational AI |
| @emollick | Ethan Mollick | ~590K | AI in practice, research, adoption patterns | Agents in Production, AI research applied |
| @garrytan | Garry Tan | ~718K | YC CEO, AI tools, developer workflows, startups | AI Infrastructure, Distribution |
| @swyx | Shawn Wang | ~100K+ | AI engineering, latent.space, agent frameworks | Agent Fleet Architecture, Context Engineering |
| @simonw | Simon Willison | ~100K+ | LLM tools, SQLite, AI in practice, open source | Operational AI, AI tooling |
| @svpino | Santiago Valdarrama | ~400K | ML engineering, AI agents, production AI | Agents in Production, AI Engineering |
| @DrJimFan | Jim Fan | ~200K+ | NVIDIA, embodied AI, foundation agents | Agent Fleet Architecture, AI Research |
| @mattshumer_ | Matt Shumer | ~100K+ | AI agents, agent companies, building with LLMs | Agents in Production, Agent Economics |
| @bindureddy | Bindu Reddy | ~50K+ | Abacus.AI CEO, AI infrastructure, agents | AI Infrastructure, Agent Economics |
| @sama | Sam Altman | ~3M | OpenAI CEO, AI strategy, model releases | Model Capabilities, AI strategy |

### Tier 2: Extended Monitoring (Query every run via `from:` search)

Strong signal, often more niche. Covers sub-territories that Tier 1 may miss. Essential for author diversity.

| Handle | Name | Followers | Primary Topics | Sub-Territory Match |
|--------|------|-----------|----------------|-------------------|
| @hwchase17 | Harrison Chase | ~80K+ | LangChain founder, agent frameworks, RAG | Agent Fleet Architecture, Context Engineering |
| @petergyang | Peter Yang | ~50K+ | AI product management, workflows, leadership | Operational AI, AI Product |
| @officiallogank | Logan Kilpatrick | ~100K+ | AI developer relations, model launches, tools | Model Capabilities, Developer Tools |
| @pvergadia | Priyanka Vergadia | ~46K | Google Cloud AI, AI architecture, dev education | AI Infrastructure, Operational AI |
| @tobi | Tobi Lutke | ~500K+ | Shopify CEO, commerce + AI, vibe coding | AI Commerce, Operational AI |
| @ylecun | Yann LeCun | ~500K+ | Meta AI chief scientist, AI research, open source | Model Capabilities, AI Research |
| @saranormous | Sarah Guo | ~100K+ | Conviction VC, AI investing, AI startups | Agent Economics, AI Strategy |
| @alexalbert__ | Alex Albert | ~50K+ | Anthropic, Claude, prompt engineering | Context Engineering, Model Capabilities |
| @jerryjliu0 | Jerry Liu | ~30K+ | LlamaIndex founder, RAG, agentic retrieval | Context Engineering, Agent Fleet Architecture |
| @ShreyaR | Shreya Rajpal | ~20K+ | Guardrails AI, LLM validation, structured output | Trust/Verification, Agent Reliability |
| @deedydas | Deedy Das | ~50K+ | Menlo Ventures, AI investing, AI talent, startups | AI Infrastructure, Agent Economics |
| @iamthezack | Zack Kass | ~50K+ | Former OpenAI Head of GTM, AI strategy, future of work | AI Strategy, Operational AI |

### Tier 3: Discovery Pool (Rotate 4-6 per run)

Accounts discovered through viral posts or zeitgeist scanning. Query a rotating subset each run. Promote to Tier 2 after 3+ high-signal appearances.

| Handle | Name | Followers | Primary Topics | Discovered Via |
|--------|------|-----------|----------------|---------------|
| @simplifyinAI | AI explainer | ~30K | AI research breakdowns, agent papers | Viral Discovery 2026-03-26 |
| @eng_khairallah1 | Khairallah | ~17.5K | Open-source AI frameworks, agent tools | Viral Discovery 2026-03-26 |
| @DivGarg_ | Div Garg | ~22K+ | AGI Inc founder (prev. MultiOn), browser agents, autonomous AI | Territory search |
| @jxnlco | Jason Liu | ~40K+ | Structured output, instructor library, AI engineering | Territory search |
| @GregKamradt | Greg Kamradt | ~30K+ | Context engineering, RAG, ARC-AGI benchmark, chunking | Territory search |
| @andyfang | Andy Fang | ~20K+ | AI product, building with LLMs | Previous brief discovery |

### Brand/Org Accounts (Monitor Only - Never Reply Targets)

These accounts are tracked for zeitgeist and news monitoring only. Posts from these accounts are NEVER collected as reply targets.

| Handle | Name | Use |
|--------|------|-----|
| @OpenAI | OpenAI | Model release timing, product news |
| @AnthropicAI | Anthropic | Claude updates, safety research |
| @GoogleAIStudio | Google AI Studio | Gemini updates |
| @GoogleDeepMind | Google DeepMind | Research releases |
| @xaborushchak | Hugging Face | Open-source model releases |

### Account Maintenance Protocol

**Automatic (every run - no human action needed):**
- The scout's Viral Discovery stage (Stage E) automatically adds new authors to Tier 3 when they meet all three criteria: 20+ likes on a territory-relevant post, scored 53+ in scoring, and 5K+ followers. The scout appends them to this file with handle, follower count, topic, and discovery date. This is how the tracked list grows organically with every run.

**Monthly (1st of each month - Dakota reviews):**
1. Check posting activity for all Tier 1 and Tier 2 accounts. Demote any that went inactive (less than 2 posts/week for 30 days).
2. Review Tier 3 discovery pool. Promote accounts that appeared as targets in 3+ briefs over the past month to Tier 2.
3. Remove accounts that consistently produce sub-48 candidates or went inactive.
4. Verify handles still resolve (accounts get suspended, renamed, or deleted).

---

## Task 2: Build the Keyword Monitoring List

Keywords and patterns to track in the X ecosystem. Organized by pillar.

### Pillar A Keywords (Product.ai Territory)

| Category | Keywords |
|----------|----------|
| AI Commerce | AI commerce, AI shopping, AI recommendations |
| Product Truth | Product truth, product verification, product data |
| Trust Architecture | Fiduciary AI, trust layer, trust architecture |
| AI + Commerce Failure | AI hallucination + commerce, AI hallucination + shopping, AI hallucination + products |
| Beige Singularity | Beige Singularity, AI slop, content collapse, recursive noise |
| Verification | Coupon verification, deal verification, promo codes + AI |

### Pillar B Keywords (AI Ecosystem)

| Category | Keywords |
|----------|----------|
| Model Releases | GPT-6, Claude, Gemini, Llama (track new releases by name) |
| Browser Agents | Browser agents, computer use, AI browsing |
| Personalization | AI personalization, user data, AI privacy |
| Infrastructure | AI infrastructure, TPU, GPU economics, compute costs |
| Agents | AI agents, autonomous agents, MCP, tool use |
| Creative AI | AI image generation, AI video, AI creative tools |
| Development | Vibe coding, AI development, AI IDE |

### Cultural/Trending Keywords

| Category | Keywords |
|----------|----------|
| AI + Current Events | AI + [current event] (monitor weekly, update terms) |
| Launch Monitoring | Any new AI product launch with >1000 engagements in 24 hours |

---

## Task 3: Build the Weekly Collection Template

Use this template for weekly X ecosystem signal collection.

```
## X ECOSYSTEM SIGNAL — Week of [Date]

### Trending Topics
[Top 3-5 trending discussions in AI/tech this week]

### Tracked Account Activity
[Notable posts from the 10-15 tracked accounts. Only include posts with
>100 engagements or that directly intersect Mike's interest clusters.]

### Keyword Hits
[Notable spikes in monitored keywords. New product launches, controversy,
consensus shifts.]

### QRT/Reply Opportunities
[Posts from high-authority accounts where Mike could add a differentiated
take via QRT or reply. Only include if Mike's expertise provides a
genuinely unique angle.]
```

---

## Monthly Update Protocol

On the first of each month:
1. Review the tracking list. Remove accounts that went inactive. Add accounts that emerged.
2. Review keyword list. Add new model names, product names, or trending terms.
3. Note which tracked accounts produced the highest-signal content last month.
4. Flag any new interest clusters that emerged from Mike's Slack activity.

---

**END OF X ECOSYSTEM SETUP PROMPT**
