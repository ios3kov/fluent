# Fluent — Product contract (draft)

Status: **discovery / design**, no implemented build in this repository at this revision.  
Rule baseline: **AS-Development-Rules v7.0.0**, commit `0a582b062d9f949eaefd2835d682a5f232abd9f0`.  
Scope: native iPhone app, initial Development gate, Standard risk. iOS minimum deployment target is TBD after Xcode/SDK check; do not invent platform support.

## Confirmed by owner
- Primary goal: learners advance from their present English level, initially with special emphasis on C1→C2, using **frequent, contemporary words and expressions** rather than academic rarity.
- All six flexible learning routes: **A0→A1, A1→A2, A2→B1, B1→B2, B2→C1, C1→C2**. “A0” is a product shorthand for a complete beginner, not an official CEFR level.
- Cards show English word/phrase, usage example and speech; reveal Russian translation/meaning, translated example and relevant nuance.
- Actions: **Know / Don't know**. Revisit unknown items with spaced practice; save progress separately for each route.
- Unlimited sessions and catalog breadth; **no artificial limit of ten daily items** or any other daily cap.
- Level choice at first launch; users can switch routes later and resume.
- Small, clean UI; works without requiring a remote account. Local progress and offline practice are baseline product decisions.

## Data and content policy
- **Not a fabricated CEFR-certified database.** Entry metadata: lemma/phrase, meaning/sense ID, category (word/collocation/idiom/phrasal verb), examples and translations, pronunciation, region, CEFR track assignment + rationale, frequency source + date, editorial status, license and attribution.
- Research candidates: open lexicon sources, corpus statistics, licensed example datasets, validated CEFR references; candidates are **not** licensed content until rights/attribution review.
- Word frequency is not identical to phrase frequency; common-word frequency must not be used as a false proxy for multiword expression frequency.
- Do not promise a scientifically exact number of C2 words or an absolute universal ranking; corpus/time/domain and genre affect frequency. Mark slang/register (neutral/formal/informal), US/UK differences and freshness.
- Start with a small **clearly labeled editorial test fixture** for UI/algorithm verification only; scale to a properly documented corpus-backed catalog separately, with deduplication and content review.
- Catalog updates must preserve stable content IDs, prior known/unknown state, version compatibility and attribution.

## Screen flows to validate
1. First launch → choose track → first card → hear pronunciation → reveal meaning → Know/Don't know → next card.
2. Return later → previous track restored → review due items → progress remains.
3. Change track → learn/review separately → change back with previous state preserved.
4. No content / no due reviews / interrupted session / corrupted DB or storage full: transparent recovery, never fake success.

## UX constraints and acceptance
- Skill-led design only **after Codex inspects actual configured design skills and reads the applicable skill files**; see `AGENTS.md`.
- Choose visual language after a small prototype and owner feedback, not from undocumented guesswork.
- Prefer visible labeled actions in addition to gestures; VoiceOver actions, Dynamic Type, Reduce Motion, high-contrast labels and safe areas.
- Early prototype acceptance: complete the main flow without instructions, know what direction a swipe takes, reverse accidental action, understand review status and return without losing state.
- Do not equate static screenshots, Swift compile, Simulator launch, physical iPhone acceptance or release readiness.

## Deferred, not implicitly accepted
- Account/cloud sync, subscriptions, AI tutor, push reminders, social/game mechanics, media downloads, iPad/macOS support, App Store upload.
- Monetization, distribution territories and minimum iOS version require explicit product/technical decisions before Release.
