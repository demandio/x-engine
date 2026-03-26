# Sensitivity Screen: Three-Tier System

**Purpose:** Evaluate every reply target and every Slack-to-X post candidate for editorial sensitivity - not just IP leakage, but topic-level risk in the ecosystem. A post can be technically clean (no internal details) and still touch a nerve.

**Referenced by:** Reply Engine (scout, scoring, drafter), Slack-to-X (scoring, transform), quality gates (both).

---

## The Three Tiers

### GREEN - Post Freely
No editorial risk. The topic is neutral or positive. No ecosystem landmines. No active controversies where engaging could backfire.

**Indicators:**
- Technical insight about infrastructure, architecture, or operational patterns
- Commentary on publicly released products, papers, or frameworks
- Reframes of common problems that help the reader without criticizing anyone
- Building-in-public observations that don't reveal sensitive details
- Evergreen operational wisdom

**Action:** No additional review needed. Proceed through the pipeline normally.

### YELLOW - Review Framing Before Posting
The topic is live, sensitive, or involves ecosystem dynamics where framing matters. The content itself may be strong, but the WAY it's said determines whether it lands well or backfires.

**Indicators:**
- Commentary on a company's public stumble, outage, or failure (even if the analysis is fair)
- Takes on layoffs, hiring freezes, or workforce impact of AI
- Commentary that could be read as criticizing a specific company, founder, or product
- Posts that touch on AI safety, regulation, or policy debates where positions are polarized
- Building-in-public content that implicitly compares Product.ai's approach to a competitor's
- Any topic where the reply could be screenshot-shared out of context and misread
- Content about a company Mike has a business relationship with (partners, investors, platforms he depends on)
- Posts about AI replacing human workers (high emotional charge regardless of accuracy)

**Action:** Flag in the brief for review before posting. The framing - not the insight (which already passed scoring) but whether the tone, word choice, and implications are calibrated correctly - needs human review. Options:
- Approve as-is
- Suggest a framing adjustment (soften, redirect, add nuance)
- Recommend holding for better timing
- Escalate to Red

### RED - Skip Unless Mike Explicitly Engages
The topic carries enough risk that Mike should only engage if he consciously decides to. These are not automatically killed - some Red topics are worth engaging with because the upside is high. But the default is skip.

**Indicators:**
- Direct commentary on a competitor's strategy, product, or public failure
- Takes on political figures' AI policy positions
- Commentary on specific individuals' job losses or career decisions
- AI doom/existential risk debates (high polarization, low upside for Mike's positioning)
- Any topic involving legal disputes, lawsuits, or regulatory actions against specific companies
- Commentary that could be construed as Mike punching down (large company CEO criticizing a startup, established player criticizing a newcomer)
- Content that requires revealing internal data to make the point (even if the data itself is not sensitive, the act of sharing it signals internal dynamics)
- Ethnic, gender, or demographic dimensions of AI workforce discussions

**Action:** Skip by default. Note in the brief: "RED FLAG: [topic]. Skipped per default protocol. If Mike wants to engage, framing review required." If Mike explicitly requests engagement, treat as Yellow (review framing before posting).

---

## How to Apply the Screen

### In the Reply Engine
**Scout (Stage 1):** Tag every candidate with a sensitivity tier (GREEN / YELLOW / RED) in the output. Use the indicators above. When in doubt, tier up (GREEN becomes YELLOW, YELLOW becomes RED).

**Scoring (Stage 2):** The sensitivity tier does NOT change the score. A RED-tier target can score 70/80 and still be flagged RED. The tier is a parallel track to scoring - it answers "should we engage?" while scoring answers "is this worth engaging with?"

**Drafter (Stage 3):** For YELLOW targets, draft the reply but add a "Framing Note" section explaining what's sensitive and what framing choices were made. For RED targets, do not draft - skip with a note.

**Delivery:** In the brief output, group targets by tier. GREEN targets are ready for Mike. YELLOW targets are flagged for framing review. RED targets are listed in a separate section with the skip note.

### In the Slack-to-X Pipeline
**Scoring:** Apply the tier during scoring. Add the tier to the scoring output alongside the numerical score.

**Transform:** For YELLOW posts, the transform output includes a "Sensitivity Framing" section explaining what's sensitive and how the framing addresses it. For RED posts, skip and do not transform unless Mike explicitly requests it.

---

## Common Scenarios

**Scenario: Company X has a major outage. Mike has a diagnostic take.**
- If Company X is a platform Mike depends on (Anthropic, OpenAI, etc.): **YELLOW**. The take may be smart but criticizing a platform you depend on has second-order effects.
- If Company X is a competitor: **RED**. Never punch a competitor when they're down. The audience remembers.
- If Company X is unrelated to Mike's business: **GREEN** if the take is structural/systemic, **YELLOW** if it's specifically about that company's decisions.

**Scenario: Mass layoffs attributed to AI.**
- **YELLOW** at minimum. Layoff commentary always carries emotional charge. If Mike's take is structural (about the economics, not the people), YELLOW. If the take could be read as celebrating job losses or minimizing impact: **RED**.

**Scenario: A founder Mike knows posts something Mike disagrees with.**
- **YELLOW**. Public disagreement with someone in your network requires careful framing. The take must be respectful, substantive, and clearly about the idea - never about the person.

**Scenario: AI regulation or policy debate.**
- **YELLOW** if Mike has a specific operational insight (not a political opinion). **RED** if the take could be read as a political stance rather than an operational observation.

---

**END OF SENSITIVITY SCREEN**
