# Fluent

Native iPhone English flashcards, from **A0→A1** through **C1→C2**, governed by [AS Development Rules v7.0.0](https://github.com/ios3kov/AS-Development-Rules/releases/tag/v7.0.0) (commit `0a582b062d9f949eaefd2835d682a5f232abd9f0`).

**Current state:** discovery + portable domain implementation. `swift test` builds the learning-domain module on macOS/Linux. **This GitHub branch is not yet a runnable iPhone app** and the final visuals have **not** been designed with the user's local Codex skills.

Previously shared starter Xcode prototype is attached in the original ChatGPT conversation, not committed here.

## Development workflow
- [Product requirements](docs/PRODUCT_SPEC.md)
- [Skill-led design brief](docs/DESIGN_BRIEF.md)
- [Run in local Codex](docs/CODEX_LOCAL_DESIGN_RUN.md)
- [Project agent instructions](AGENTS.md)

The six learning tracks, cards and spaced repetition are specified. Full corpus-backed, licensed content and CEFR validation are separate work. No invented C2 word counts, daily quotas, network account or TestFlight/App Store upload.

Portable quick check: `swift test`. iPhone QA and skills inventory are **NOT_RUN** in this repository.
