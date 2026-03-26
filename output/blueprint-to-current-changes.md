# Blueprint-to-Current System: Required Updates

**Context:** The Notion page "EXECUTION PLAN | Mike X Strategy: The Reply Engine + Slack-to-X Pipeline" (dated February 19, 2026) is the original blueprint. The live system has since received significant improvements from backtest evaluations (Feb 7-21) and the X Twitter API integration (March 5). This document itemizes every change needed to bring the blueprint in sync with the current production system.

**Instructions for Notion AI:** Apply each change below to the Execution Plan page. Changes are organized by section. For each change, the exact current text that needs updating is quoted, followed by what it should be replaced with and why.

---

## CHANGE 1: Status Line Update

**Location:** Top of document, the `**Status:**` line

**Current text:**
> Status: Prototype v1. Ready for your review.

**Replace with:**
> Status: Prototype v2.1. Backtest-validated with Feb 7-21 eval refinements. X Twitter API integrated. Active daily operation.

**Why:** The system has moved well past prototype v1. It has been backtested, refined based on eval data, and upgraded with direct X API access.

---

## CHANGE 2: System 1 Architecture - Data Sources

**Location:** "How It Works" > "System 1: The Reply Engine" code block, first branch

**Current text:**
```
     |-- Scouts 30-50 candidates from the X ecosystem
     |   (Tracked accounts in your niche, trending AI topics,
     |    cross-referenced with your Slack activity for context)
```

**Replace with:**
```
     |-- Scouts 30-50 candidates from the X ecosystem
     |   (X Twitter API (primary) + WebSearch (fallback),
     |    tracked accounts in your niche, trending AI topics,
     |    cross-referenced with your Slack activity for context)
```

**Why:** The system now uses the X Twitter MCP (direct API) as the primary data source for scouting, with WebSearch as an explicit fallback. This was integrated on March 5, 2026. The API provides exact follower counts, full post text, and precise engagement metrics - data that WebSearch could only estimate.

---

## CHANGE 3: System 1 Architecture - Quality Gate Count

**Location:** "How It Works" > "System 1: The Reply Engine" code block, quality gate line

**Current text:**
```
     |-- Quality gate: Scroll Test, Voice Test, Gift Test
```

**Replace with:**
```
     |-- Quality gate: 4 checks (3 per-reply + 1 brief-level)
     |   Per-reply: Scroll Test, Voice Test, Gift Test, Outside-In Check
     |   Brief-level: Monotony Test (pattern diversity, gift diversity,
     |    topic diversity, profile scroll test)
```

**Why:** The quality gate for replies has been expanded since the blueprint. Gate 3b (Outside-In Check) was added to ensure reply openings center the reader's problem, not Mike's experience. Gate 4 (Monotony Test) was added as a brief-level gate that checks the full set of replies for pattern monotony, gift monotony, topic monotony, and whether Mike's profile would read as one-note. This was built to fix "reply diversity collapse" identified in backtesting.

---

## CHANGE 4: System 1 Architecture - Data Confidence Protocol (New)

**Location:** "How It Works" > "System 1: The Reply Engine" code block, insert a new branch after the scoring section and before the drafting section

**Insert this new block:**
```
     |
     |-- Data Confidence Protocol:
     |   Every data point labeled VERIFIED (from X API)
     |   or ESTIMATED (from WebSearch fallback).
     |   Scoring penalty: -2 for estimated data,
     |   -3 for truncated post text, max -5 stacked.
     |   Prevents overconfidence on incomplete data.
```

**Why:** The Data Confidence Protocol was added during the backtest refinements. It ensures the scoring engine and drafter know exactly how reliable their data is. When the X API is available, most data is VERIFIED and no penalties apply. When WebSearch is used as fallback, penalties are applied to account for the uncertainty.

---

## CHANGE 5: System 1 Architecture - Source Material Validation (New)

**Location:** "How It Works" > "System 1: The Reply Engine" code block, insert a new branch after the drafting line and before the quality gate line

**Insert this new block:**
```
     |
     |-- Source Material Validation (Step 0 before drafting):
     |   If the target post references an article, paper, or
     |   announcement, the system fetches and verifies it before
     |   drafting. Labels: VALIDATED / PARTIAL / UNVALIDATED / N/A.
     |   Prevents Mike from replying based on a misreading.
```

**Why:** Source Material Validation was added during the backtest refinements after identifying that some drafted replies engaged with claims from articles the system hadn't actually read - just inferred from the post text. This step ensures reply precision matches Mike's credibility standard.

---

## CHANGE 6: System 2 Architecture - Slack Scanning Scope

**Location:** "How It Works" > "System 2: The Slack-to-X Pipeline" code block, first line

**Current text:**
```
Your Slack messages across #ai-news, #productai, #ai-agents, #ai-prompting, #ai-dev
```

**Replace with:**
```
Your Slack messages across ALL public channels (searched via your user ID)
```

**Why:** The Slack-to-X daily scan now searches all public Slack channels using Mike's user ID (U02BJAWG9), not just the 5 primary channels. Mike drops insights in threads, side channels, and ad hoc conversations that are not on the primary list. The 5 channels (#ai-news, #productai, #ai-agents, #ai-dev, #ai-prompting) are still the primary signal sources for the Reply Engine, but the Slack-to-X scan casts a wider net.

---

## CHANGE 7: System 2 Architecture - Scanning Description

**Location:** "How It Works" > "System 2: The Slack-to-X Pipeline" code block, second branch

**Current text:**
```
     |-- Automated daily scan of your activity
     |   (Dakota can also manually flag messages for
     |    time-sensitive or edge-case processing)
```

**Replace with:**
```
     |-- Automated daily scan of your activity across the full workspace
     |   (Not limited to specific channels - catches insights you drop
     |    in threads, side channels, and ad hoc conversations.
     |    Dakota can also manually flag messages for
     |    time-sensitive or edge-case processing)
```

**Why:** Clarifies that the scan is workspace-wide, matching the current system behavior.

---

## CHANGE 8: System 2 Architecture - Quality Gate Count

**Location:** "How It Works" > "System 2: The Slack-to-X Pipeline" code block

**Current text:**
```
     |   runs 5-gate quality check
```

**Replace with:**
```
     |   runs 7-gate quality check
```

**Why:** The quality gate for posts has been expanded from 5 to 7 gates. Gate 6 (Outside-In Test) ensures the first sentence of every post centers the reader's problem, not Mike's experience. Gate 7 (Outsider Legibility Test) ensures a stranger in the AI/tech space can understand every word without knowing who Mike is or what he builds. Gate 7 was added during the backtest refinements to fix the "insider framing" failure mode.

---

## CHANGE 9: System 2 Architecture - Source Material Validation (New)

**Location:** "How It Works" > "System 2: The Slack-to-X Pipeline" code block, insert a new branch after the transform line and before the sensitivity screen

**Insert this new block:**
```
     |
     |-- Source Material Validation (Step 0 before transform):
     |   If the Slack message references external material,
     |   the system fetches and verifies it before transforming.
     |   Labels: VALIDATED / PARTIAL / UNVALIDATED / N/A.
```

**Why:** Same rationale as Change 5. Source validation was added to both systems during the backtest refinements to prevent posts that engage with material the system hasn't verified.

---

## CHANGE 10: System 2 Architecture - Context Pyramid (New Section)

**Location:** "How It Works" > "System 2: The Slack-to-X Pipeline" code block, insert after the existing sensitivity screen block

**Insert this new block:**
```
     |
     |-- Context Pyramid (3-layer system):
     |   Layer 1 (Bedrock): Mike's core axioms. Never changes.
     |   Layer 2 (Hardened Clay): Thematic currents from the last
     |    30-60 days. Updated bi-weekly via Thematic Scan.
     |   Layer 3 (Wet Clay): Today's moment (what the Slack
     |    message is reacting to).
     |   Best posts connect all three layers.
```

**Why:** The Context Pyramid and Thematic Scan are new additions to the system architecture that didn't exist when the blueprint was written. The Thematic Scan runs bi-weekly, identifies thematic clusters from Mike's Slack activity, cross-references them against the X zeitgeist, and produces a structured context file that the Reply Engine drafter and Slack-to-X transform use as Layer 2 context. This prevents content from being purely reactive and helps connect daily posts to larger narrative threads Mike is building.

---

## CHANGE 11: Scoring Dimensions - Large Account Adjustment

**Location:** "How It Works" > "System 1: The Reply Engine" code block, the Account Quality dimension line

**Current text:**
```
     |   Account Quality (1x)
```

**Replace with:**
```
     |   Account Quality (1x) - 200K-500K accounts with relevant
     |    AI/tech audiences now score 7-8 (not auto-penalized)
```

**Why:** Backtesting revealed a "large account penalty" where relevant 200K-500K follower accounts were being scored low simply because of follower count. The scoring rubric was refined: accounts in the 200K-500K range with relevant AI/tech builder audiences now score 7-8. The penalty now kicks in above 500K or when the audience is non-builder/general, regardless of size. The penalty driver is audience irrelevance, not follower count.

---

## CHANGE 12: "What You Can Adjust" - Channel Scanning

**Location:** "Your Controls" > "What You Can Adjust" section

**Current text:**
> Channels scanned for Slack-to-X (currently #ai-news, #productai, #ai-agents, #ai-dev, #ai-prompting)

**Replace with:**
> Channels scanned for Slack-to-X daily scan (currently all public channels via your Slack user ID - catches insights wherever you drop them). The Reply Engine uses 5 primary channels (#ai-news, #productai, #ai-agents, #ai-dev, #ai-prompting) for Slack signal, plus all public channels for the Slack-to-X scan.

**Why:** Matches the current system behavior where the Slack-to-X scan searches all public channels, not just the 5 listed.

---

## CHANGE 13: Architecture Section - Technology Stack Update

**Location:** "The Architecture (For Reference)" section

**Current text:**
> The intelligence layer (scouting, scoring, drafting, quality gating) runs in Claude Code with full access to Slack, WebSearch, and your grounding files.

**Replace with:**
> The intelligence layer (scouting, scoring, drafting, quality gating) runs in Claude Code with full access to Slack (via Slack MCP), the X/Twitter ecosystem (via X Twitter MCP for direct API access, with WebSearch as fallback), and your grounding files.

**Why:** The technology stack has been upgraded. X Twitter MCP is now the primary data source for X post discovery, providing verified data (exact follower counts, engagement metrics, full post text). WebSearch serves as a fallback when the API is unavailable or rate-limited. All data is labeled VERIFIED or ESTIMATED so the scoring engine knows how reliable it is.

---

## CHANGE 14: "What We Are Asking" Section - Update Live Test Duration

**Location:** "What We Are Asking" section, item 2

**Current text:**
> Run a 1-2 day live test. You receive daily briefs and give us real feedback on what sounds like you, what does not, and what targets were worth your time.

**Replace with:**
> Run a 1-week live trial. You receive daily briefs and give us real feedback on what sounds like you, what does not, and what targets are worth your time.

**Why:** Based on our operational experience, 1-2 days is too short to calibrate the system across different news cycles (quiet days, heavy days, weekends). A 1-week trial captures more variety and gives enough signal to tune scoring weights and voice patterns.

---

## CHANGE 15: Phase 2 - Update Trial Duration and Add Calibration Step

**Location:** "Recommended Next Steps" > "Phase 2: Short Live Test (1-2 days)"

**Current section title:**
> Phase 2: Short Live Test (1-2 days)

**Replace section title with:**
> Phase 2: Manual Live Trial (1 Week)

**Add this new bullet to the end of the Phase 2 checklist:**
> - [ ] End-of-week calibration session: adjust scoring weights, voice patterns, and territory boundaries based on Mike's feedback

**Why:** The 1-week duration gives us enough data across different news cycles. The calibration session at the end of the week is the formal feedback integration point before moving to automation.

---

## CHANGE 16: Phase 3 - Add X Twitter MCP to Tool Permissions

**Location:** "Recommended Next Steps" > "Phase 3: Moltbot Integration (Dylan)", second bullet

**Current text:**
> Build a Moltbot skill that triggers a Claude Code session with pre-approved tool permissions (Slack MCP read, WebSearch, file read/write) so no manual "Allow" clicks are needed

**Replace with:**
> Build a Moltbot skill that triggers a Claude Code session with pre-approved tool permissions (Slack MCP read, X Twitter MCP read, WebSearch, file read/write) so no manual "Allow" clicks are needed

**Why:** X Twitter MCP is now part of the tool stack and needs to be included in the pre-approved permissions for unattended operation.

---

## CHANGE 17: Phase 4 - Add Spec as Feedback Loop and Thematic Scan

**Location:** "Recommended Next Steps" > "Phase 4: Live Automated Operation (Ongoing)"

**Add this new bullet as the FIRST item in the Phase 4 checklist:**
> - [ ] Continue using the spec as the primary feedback loop, updating grounding and rubrics as we go (grounding changes are the main iteration surface, independent of Moltbot)

**Add this new bullet after the existing Slack-to-X Pipeline bullet:**
> - [ ] Thematic Scan runs bi-weekly: scans Mike's Slack activity over a 30-60 day window, identifies thematic clusters, cross-references against the X zeitgeist, and produces a structured context file (output/thematic-context.md) that the Reply Engine and Slack-to-X Pipeline use as Layer 2 context

**Why:** The spec-as-feedback-loop principle and the Thematic Scan are new operational components that didn't exist when the blueprint was written. The Thematic Scan is what connects daily reactive content to Mike's longer-term narrative threads.

---

## CHANGE 18: Reply Engine Quality Gate in Sample Targets

**Location:** "Live Prototype Outputs" > each TARGET section's Quality Gate line

**Current text (appears on each target):**
> Quality Gate: PASS (3/3)

**Replace with (on each target):**
> Quality Gate: PASS (4/4)

**Why:** The per-reply quality gate now has 4 checks (Scroll, Voice, Gift, Outside-In), not 3. Update the count on all sample targets: Target 1, Target 2, and Target 4.

---

## CHANGE 19: Target 1 Quality Gate Detail

**Location:** "Live Prototype Outputs" > Target 1, Quality Gate line

**Current text:**
> Quality Gate: PASS (3/3) - Scroll: hooks immediately with the UCP/TAP framing. Voice: Binary Reduction pattern, active, punchy. Gift: reader walks away understanding the missing layer in the agentic commerce stack.

**Replace with:**
> Quality Gate: PASS (4/4) - Scroll: hooks immediately with the UCP/TAP framing. Voice: Binary Reduction pattern, active, punchy. Gift: reader walks away understanding the missing layer in the agentic commerce stack. Outside-In: first sentence is about the industry problem (protocol vs. payment vs. truth), not Mike's company.

**Why:** Adds the Outside-In check result to the quality gate output, matching the current system's 4-gate format.

---

## CHANGE 20: Target 2 Quality Gate Detail

**Location:** "Live Prototype Outputs" > Target 2, Quality Gate line

**Current text:**
> Quality Gate: PASS (3/3) - Builder's Aside pattern. Connects benchmark to operational reality.

**Replace with:**
> Quality Gate: PASS (4/4) - Scroll: MRCR comparison hooks immediately. Voice: Builder's Aside pattern. Gift: connects benchmark to operational reality (which tasks you can delegate). Outside-In: first sentence is about the benchmark delta, not Mike's systems.

**Why:** Expands the quality gate output to match the current 4-gate format with all checks listed.

---

## CHANGE 21: Target 4 Quality Gate Detail

**Location:** "Live Prototype Outputs" > Target 4, Quality Gate line

**Current text:**
> Quality Gate: PASS (3/3) - Contextual Wedge pattern ("Right, but the part nobody's talking about is..."). Gift: the reader sees that verification is the missing primitive in multi-agent architectures.

**Replace with:**
> Quality Gate: PASS (4/4) - Scroll: opens with the protocol question, familiar framing. Voice: Contextual Wedge pattern. Gift: the reader sees that verification is the missing primitive in multi-agent architectures. Outside-In: first sentence is about the industry problem (agent-to-agent protocols), not Mike's experience.

**Why:** Expands the quality gate output to match the current 4-gate format.

---

## CHANGE 22: Slack-to-X Sample Quality Gate Count

**Location:** "Live Prototype Outputs" > "Slack-to-X Pipeline: Sample Transform", Quality Gate line

**Current text:**
> Quality Gate: 8/10 - All 5 gates passed

**Replace with:**
> Quality Gate: 8/10 - All 7 gates passed

**Why:** The quality gate for posts now has 7 gates (Scroll, Gift, Voice, Throughline, Follow, Outside-In, Outsider Legibility), not 5. The Outside-In and Outsider Legibility gates were added post-blueprint.

---

## CHANGE 23: Add New Section - Thematic Scan (System 3)

**Location:** After "System 2: The Slack-to-X Pipeline" section, before "Live Prototype Outputs"

**Insert this new section:**

> ### System 3: The Thematic Scan (Bi-Weekly)
>
> ```
> Every 2 weeks - Layer 2 context generator
>      |
>      |-- Scans Mike's Slack messages from the past 30-60 days
>      |   across ALL public channels (not just the 5 primary ones)
>      |
>      |-- Identifies thematic clusters: topics Mike has returned to
>      |   3+ times across different conversations
>      |
>      |-- Cross-references each cluster against the X zeitgeist:
>      |   Hot / Warm / Cold / Saturated
>      |
>      |-- Maps content opportunities for each cluster:
>      |   Thread / Reply ammunition / Reactive trigger /
>      |   Building-in-public
>      |
>      |-- Outputs structured thematic context to
>      |   output/thematic-context.md
>      |
>      v
> Used by Reply Engine drafter and Slack-to-X transform
> as Layer 2 context (the connective tissue between
> daily reactions and long-term positioning)
> ```

**Why:** The Thematic Scan is a new system component that didn't exist when the blueprint was written. It runs bi-weekly, produces the Layer 2 context file, and is the mechanism that prevents content from being purely reactive. The Reply Engine drafter and Slack-to-X transform both reference this file to connect daily content to larger narrative threads.

---

## CHANGE 24: Add "Data Confidence" to Sample Target Scoring

**Location:** "Live Prototype Outputs" > all TARGET sections, after the score breakdown

**On each target (1, 2, 3, and 4), add this line after the scoring table:**

> **Data Confidence:** VERIFIED (all data from X Twitter MCP) | No confidence adjustments applied.

**Why:** The Data Confidence Protocol is now part of every scoring output. Including it in the sample targets shows Mike how the system handles data reliability. Since these are sample outputs from when only WebSearch was available, you could alternatively mark them as:

> **Data Confidence:** ESTIMATED (data from WebSearch) | Score adjusted -2 for estimated data.

Use whichever is more accurate to the data source at the time of the original prototype run (February 19 was pre-API, so ESTIMATED is technically correct for the historical samples).

---

## CHANGE 25: Add "Source Validation" to Sample Target Drafts

**Location:** "Live Prototype Outputs" > Targets 1, 2, and 4, after Quality Gate line

**Add this line to each passing target:**

> **Source Validation:** N/A - reply engages with the original post's claim directly, no external source referenced.

**For Target 4 specifically, consider:**

> **Source Validation:** N/A - reply builds on the protocol discussion without referencing external material.

**Why:** Source Material Validation is now Step 0 of the drafting process. Including it in sample outputs shows Mike that the system checks its sources before drafting.

---

## SUMMARY OF ALL CHANGES

| # | Section | Type | What Changed |
|---|---------|------|-------------|
| 1 | Status line | Update | v1 → v2.1 with backtest and API notes |
| 2 | Reply Engine architecture | Update | Added X Twitter API as primary data source |
| 3 | Reply Engine architecture | Update | Quality gate 3 → 4 checks (added Outside-In + Monotony) |
| 4 | Reply Engine architecture | New | Data Confidence Protocol block |
| 5 | Reply Engine architecture | New | Source Material Validation block |
| 6 | Slack-to-X architecture | Update | Channel scope: 5 channels → all public channels |
| 7 | Slack-to-X architecture | Update | Scanning description expanded |
| 8 | Slack-to-X architecture | Update | Quality gate 5 → 7 gates (added Outside-In + Outsider Legibility) |
| 9 | Slack-to-X architecture | New | Source Material Validation block |
| 10 | Slack-to-X architecture | New | Context Pyramid / Thematic Scan reference |
| 11 | Reply Engine scoring | Update | Large account scoring adjustment (200K-500K) |
| 12 | Your Controls | Update | Channel scanning scope clarification |
| 13 | Architecture | Update | Technology stack (added X Twitter MCP) |
| 14 | What We Are Asking | Update | 1-2 day test → 1-week trial |
| 15 | Phase 2 | Update | Title + added calibration session |
| 16 | Phase 3 | Update | Added X Twitter MCP to tool permissions |
| 17 | Phase 4 | New | Spec feedback loop + Thematic Scan bullets |
| 18-21 | Sample targets | Update | Quality gate counts 3/3 → 4/4 with Outside-In detail |
| 22 | Slack-to-X sample | Update | Quality gate 5 → 7 gates |
| 23 | How It Works | New | Thematic Scan section (System 3) |
| 24 | Sample targets | New | Data Confidence line on all targets |
| 25 | Sample targets | New | Source Validation line on passing targets |

**Total: 25 changes (11 updates to existing text, 8 new additions, 6 sample output updates)**
