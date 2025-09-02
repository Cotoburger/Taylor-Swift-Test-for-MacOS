import SwiftUI

// MARK: - Модель вопроса
struct Question {
    let text: String
    let options: [String]
    let points: [Int] // баллы за каждый вариант
}

// MARK: - Пример вопросов
let quiz: [Question] = [
    Question(
        text: "What country does Taylor Swift live in?",
        options: ["Russia", "Finland", "USA", "Greenland"],
        points: [-2, -1, 2, -1] // аналог C++ кода
    ),
    Question(
        text: "Как зовут кошку Тейлор Свифт?",
        options: ["Meredith", "Olivia", "Fluffy", "Snowball"],
        points: [2, -1, -1, -2]
    ),
    Question(
        text: "Какой первый студийный альбом Тейлор Свифт?",
        options: ["Fearless", "Taylor Swift", "Red", "1989"],
        points: [-1, 2, -1, -2]
    ),
    Question(
        text: "Are you on r/TaylorSwift?",
        options: ["No", "Yes"],
        points: [-1, 2]
    ),
    Question(
        text: "Are you Taylor Swift fan?",
        options: ["No", "Yes"],
        points: [-2, 2]
    ),
    Question(
        text: "Motherland or Taylor Swift?",
        options: ["Motherland", "Taylor Swift"],
        points: [1, 2]
    ),
    Question(
        text: "What is Taylor Swift's favorite cat breed?",
        options: ["Scottish Fold", "Russian Blue", "Maine Coon"],
        points: [1, -1, 0]
    ),
    Question(
        text: "What year was Taylor Swift born?",
        options: ["1989", "Other"],
        points: [2, -2]
    ),
    Question(
        text: "Which album is Taylor Swift's best-selling album in its first week of release in the USA?",
        options: ["1989", "Reputation", "Fearless (Taylor's Version)", "Lover"],
        points: [2, -1, 0, -1]
    ),
    Question(
        text: "Taylor Swift is...",
        options: ["Man", "Woman", "Girl"],
        points: [-1, 0, 2]
    ),
    Question(
        text: "Do you support war in Ukraine?",
        options: ["No", "Yes"],
        points: [2, -1]
    ),
    Question(
        text: "Are you subscribed to Taylor Swift TikTok?",
        options: ["No", "Yes", "Maybe"],
        points: [-1, 2, 0]
    )
]

