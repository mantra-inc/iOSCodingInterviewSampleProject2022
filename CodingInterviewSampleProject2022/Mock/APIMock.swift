//
//  APIMock.swift
//  CodingInterviewSampleProject2022
//
// The data is exported from MTGJSON (https://mtgjson.com/license/)

import Foundation

// TODO: Move this to different module
protocol API {
    /**
     This will return JSON object encoded by utf8
     
        Returns a json string which includes array of cards object. Each card object has...
        - id: String : unique id for each card
        - nameEnglish: String : card name in English
        - nameJapanese: String : card name in Japanese
        - textEnglish: String : card abilities in English
        - textJapanese: String : card abilities in Japanese
        - image_urls: List[String] : card image url
     */
    func getCards() async throws -> String
}

enum APIError: Error {
    case cardDoesNotExist
    case networkError
}

class APIImpl {
    static let shared = APIImpl()

    private var cards: String = "[]"
    
    init() {
        self.cards = getAllCardsRawData()
    }
    
    private func getAllCardsRawData() -> String {
        guard let fileURL = Bundle.main.url(forResource: "mtg_card_subset", withExtension: "json"),
              let cardString = try? String(contentsOf: fileURL, encoding: .utf8) else {
            fatalError("Failed to read initial data")
        }
        return cardString
    }
}


extension APIImpl: API {
    func sleep(seconds: Int) async throws {
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
    }
    func getCards() async throws -> String {
        try await sleep(seconds: 1)
        return cards
    }
    
}
