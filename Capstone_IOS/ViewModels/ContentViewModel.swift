import Foundation

func loadContentItems(from lesson: String) -> [ContentItem] {
    let fileName = "\(lesson.replacingOccurrences(of: " ", with: ""))"

    guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "geojson") else {
        print("File not found: \(fileName)")
        return []
    }

    do {
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let contentResponse = try decoder.decode(ContentResponse.self, from: data)
        return contentResponse.content
    } catch {
        print("Error loading or decoding data: \(error)")
        return []
    }
}

struct ContentResponse: Decodable {
    let content: [ContentItem]
}
