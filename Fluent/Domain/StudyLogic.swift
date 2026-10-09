import Foundation

/// Provisional scheduling heuristic — not a claim of CEFR proficiency or validated pedagogy.
public enum StudyLogic {
    public static let knownIntervalsInDays = [1, 3, 7, 14, 30, 60, 120]

    public static func grade(_ previous: ReviewState?, cardID: String, known: Bool, now: Date) -> ReviewState {
        var state = previous ?? ReviewState(
            cardID: cardID, streak: 0, reviews: 0, misses: 0, intervalDays: 0, dueAt: now
        )
        state.reviews += 1
        if known {
            state.streak += 1
            let index = min(state.streak - 1, knownIntervalsInDays.count - 1)
            state.intervalDays = knownIntervalsInDays[index]
            state.dueAt = now.addingTimeInterval(TimeInterval(state.intervalDays) * 86_400)
        } else {
            state.streak = 0
            state.intervalDays = 0
            state.misses += 1
            state.dueAt = now.addingTimeInterval(10 * 60)
        }
        return state
    }

    /// Due reviews come first, followed by new content; no card repeats in a pass.
    public static func next(deck: [Flashcard], progress: [String: ReviewState],
                            seen: Set<String>, now: Date, freePractice: Bool) -> Flashcard? {
        let eligible = deck.filter { card in
            if seen.contains(card.id) { return false }
            guard let review = progress[card.id] else { return true }
            return freePractice || review.dueAt <= now
        }
        return eligible.sorted { left, right in
            func priority(_ card: Flashcard) -> Int {
                guard let state = progress[card.id] else { return 1 }
                return state.dueAt <= now ? 0 : 2
            }
            let a = priority(left), b = priority(right)
            return a == b ? left.rank < right.rank : a < b
        }.first
    }

    public static func establishedCount(deck: [Flashcard], progress: [String: ReviewState]) -> Int {
        deck.reduce(0) { count, card in count + ((progress[card.id]?.streak ?? 0) >= 3 ? 1 : 0) }
    }
}
