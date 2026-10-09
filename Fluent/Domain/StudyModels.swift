import Foundation

public enum CEFRLevel: String, Codable, CaseIterable, Identifiable {
    case a0a1 = "A0_A1"
    case a1a2 = "A1_A2"
    case a2b1 = "A2_B1"
    case b1b2 = "B1_B2"
    case b2c1 = "B2_C1"
    case c1c2 = "C1_C2"

    public var id: String { rawValue }
    public var title: String {
        switch self {
        case .a0a1: "A0 → A1"
        case .a1a2: "A1 → A2"
        case .a2b1: "A2 → B1"
        case .b1b2: "B1 → B2"
        case .b2c1: "B2 → C1"
        case .c1c2: "C1 → C2"
        }
    }
    public var subtitle: String {
        switch self {
        case .a0a1: "Начинаю говорить"
        case .a1a2: "Понимаю повседневную речь"
        case .a2b1: "Говорю увереннее"
        case .b1b2: "Выражаю сложные мысли"
        case .b2c1: "Говорю свободно"
        case .c1c2: "Чувствую нюансы языка"
        }
    }
}

public struct Flashcard: Codable, Identifiable, Equatable {
    public let id: String
    public let level: CEFRLevel
    public let term: String
    public let meaning: String
    public let example: String
    public let exampleTranslation: String
    public let note: String
    public let variety: String
    public let rank: Int
    public let source: String
    public let license: String

    public init(id: String, level: CEFRLevel, term: String, meaning: String,
                example: String, exampleTranslation: String, note: String,
                variety: String, rank: Int, source: String, license: String) {
        self.id = id
        self.level = level
        self.term = term
        self.meaning = meaning
        self.example = example
        self.exampleTranslation = exampleTranslation
        self.note = note
        self.variety = variety
        self.rank = rank
        self.source = source
        self.license = license
    }
}

public struct ReviewState: Codable, Equatable {
    public let cardID: String
    public var streak: Int
    public var reviews: Int
    public var misses: Int
    public var intervalDays: Int
    public var dueAt: Date

    public init(cardID: String, streak: Int, reviews: Int, misses: Int,
                intervalDays: Int, dueAt: Date) {
        self.cardID = cardID
        self.streak = streak
        self.reviews = reviews
        self.misses = misses
        self.intervalDays = intervalDays
        self.dueAt = dueAt
    }
}
