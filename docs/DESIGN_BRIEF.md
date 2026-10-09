# Fluent — Skill-led UX design task

**State:** DESIGN NOT STARTED (local Codex skill inventory not visible in ChatGPT); this is a task brief, not a claim that a design skill has been applied.

## Before sketches
- Open this repository in Codex, inspect skills *already enabled in Codex settings* and read actual design-related `SKILL.md` instructions/resources.
- Capture a short skill-use record: skill name, exact accessible source/version/hash where available, relevant principles, applicable scope, and whether use is text-only or requires approved execution/remote provider. Never claim loaded skills from settings alone.
- Follow the pinned AS v7.0.0 skill/UX/accessibility rules and `docs/PRODUCT_SPEC.md`.

## One flow to prototype first
1. Welcome / choose one of six learning routes. A0 is the app's own pre-A1 label.
2. Card front: English expression or word, listening action, an authentic-sounding English usage example, light progress context.
3. Reveal: Russian meaning, example translation and concise usage nuance. Reversible interaction, not a page full of information.
4. Two visible, accessible actions: **Don't know** (schedule for review) / **Know** (lower priority). Optional swipes only as shortcuts, and clear undo.
5. Immediate next card; switching tracks and returning restores individual progress.
6. Due-review and finished-for-now states must not impose an artificial daily cap or hide available material.

## Design choices to research / show
- Compare *at least two lightweight visual directions* with the actual selected skills, but present only the best-reasoned variant and one alternative for a meaningful owner decision.
- Design for one-handed iPhone use, large readable typography, short thumb travel, minimal chrome, natural motion that respects Reduce Motion.
- Don't confuse CEFR levels with artificial gamification. Preserve the sense of unlimited self-paced study.
- Avoid unreviewed emoji flags as pronunciation/region semantics or color as the sole action cue.
- Russian UI + English example text; account for long English phrases and lengthy Russian translations.
- Use early native SwiftUI prototype rather than treating Figma screenshots or a web mock as device acceptance.

## Evidence / acceptance
- Record which exact design skills actually ran, design decision and owner outcome.
- Check full flow, gesture alternatives, text truncation, empty/no-due state, offline, persistent progress, VoiceOver, Dynamic Type, contrast, safe areas and small phones.
- Document separate states for prototype review, simulator build and actual iPhone QA. No claims of either until executed.
