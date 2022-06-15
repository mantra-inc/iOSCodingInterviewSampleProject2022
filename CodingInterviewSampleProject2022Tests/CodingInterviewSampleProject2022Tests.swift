//
//  CodingInterviewSampleProject2022Tests.swift
//  CodingInterviewSampleProject2022Tests
//
//

import XCTest
@testable import CodingInterviewSampleProject2022

class CodingInterviewSampleProject2022Tests: XCTestCase {
    var api: API!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.api = APIImpl()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetAllCards() async throws {
        let ret = try await api.getCards()
        XCTAssertFalse(ret.isEmpty)
    }
}
