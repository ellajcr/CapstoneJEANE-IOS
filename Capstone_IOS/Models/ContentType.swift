import Foundation

struct ContentItem: Identifiable, Hashable, Decodable {
    var id: UUID? = UUID()
    var type: ContentType
    var title: String?
    var text: String?
    var image: String?
    var alt: String?

    var quiz: QuizItem?

    struct QuizItem: Decodable, Hashable {
        let questionNumber: Int
        let question: String
        let choices: [Choice]
        let answerIndex: Int
        
        struct Choice: Decodable, Hashable {
            let name: String
            let explanation: String
        }
    }
}

enum ContentType: String, Decodable {
    case lecture
    case quiz
}


