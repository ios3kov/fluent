import Foundation
import XCTest
@testable import FluentDomain

final class StudyLogicTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_700_000_000)
    private func card(_ id: String, rank: Int) -> Flashcard {
        Flashcard(id: id, level: .c1c2, term: id, meaning: id,
                  example: id, exampleTranslation: id, note: "", variety: "both",
                  rank: rank, source: "test", license: "original")
    }
    func testFirstKnownReviewIsNextDay() {
        let state = StudyLogic.grade(nil, cardID: "a", known: true, now: now)
        XCTAssertEqual(state.streak, 1)
        XCTAssertEqual(state.reviews, 1)
        XCTAssertEqual(state.intervalDays, 1)
        XCTAssertEqual(state.dueAt, now.addingTimeInterval(86_400))
    }
    func testKnownSequence() {
        var state: ReviewState?
        for (index, expected) in StudyLogic.knownIntervalsInDays.enumerated() {
            state = StudyLogic.grade(state, cardID: "a", known: true, now: now)
            XCTAssertEqual(state?.intervalDays, expected, "grade \(index + 1)")
        }
    }
    func testUnknownResetsStreakAndSchedulesSoon() {
        let learned = StudyLogic.grade(nil, cardID: "a", known: true, now: now)
        let missed = StudyLogic.grade(learned, cardID: "a", known: false, now: now)
        XCTAssertEqual(missed.streak, 0)
        XCTAssertEqual(missed.misses, 1)
        XCTAssertEqual(missed.dueAt, now.addingTimeInterval(600))
    }
    func testDueBeforeUnseenAndNoImmediateRepetition() {
        let unseen = card("new", rank: 1), due = card("due", rank: 10)
        let progress = ["due": ReviewState(cardID: "due", streak: 1, reviews: 1, misses: 0,
                    intervalDays: 1, dueAt: now.addingTimeInterval(-60))]
        XCTAssertEqual(StudyLogic.next(deck: [unseen,due], progress: progress,
                       seen: [], now: now, freePractice: false)?.id, "due")
        XCTAssertEqual(StudyLogic.next(deck: [unseen,due], progress: progress,
                       seen: ["due"], now: now, freePractice: false)?.id, "new")
    }
    func testFutureReviewsAreSkippedUntilFreePractice() {
        let entry = card("a", rank: 1)
        let future = ReviewState(cardID: "a", streak: 1, reviews: 1, misses: 0,
                                 intervalDays: 1, dueAt: now.addingTimeInterval(2000))
        XCTAssertNil(StudyLogic.next(deck: [entry], progress: ["a": future],
                      seen: [], now: now, freePractice: false))
        XCTAssertNotNil(StudyLogic.next(deck: [entry], progress: ["a": future],
                         seen: [], now: now, freePractice: true))
    }
    func testEstablishmentThresholdIsNotConfusedWithCardCount() {
        let entries = [card("a",rank:1),card("b",rank:2)]
        let progress = ["a": ReviewState(cardID: "a",streak:3,reviews:3,misses:0,
                                         intervalDays:7,dueAt:now)]
        XCTAssertEqual(StudyLogic.establishedCount(deck: entries, progress: progress), 1)
    }
}
