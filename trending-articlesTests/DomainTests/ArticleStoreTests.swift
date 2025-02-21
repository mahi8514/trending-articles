//
//  ArticleStoreTests.swift
//  trending-articles
//
//  Created by mahi  on 21/02/2025.
//

import XCTest
@testable import trending_articles

final class ArticleStoreTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Mock not activated state
        ArticleStoreImpl.activate(baseUrl: nil, apiKey: nil)
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testStoreActivate() throws {
        let expectedBaseUrl = "https://example.com"
        let expectedApiKey = "example-api-key"
        
        ArticleStoreImpl.activate(baseUrl: "https://example.com", apiKey: "example-api-key")
        
        XCTAssertEqual(try! ArticleStoreImpl.getBaseUrl(), expectedBaseUrl)
        XCTAssertEqual(try! ArticleStoreImpl.getAPIKey(), expectedApiKey)
    }
    
    func testStoreNotActivateError() throws {
        XCTAssertThrowsError(try ArticleStoreImpl.getBaseUrl())
    }
}
