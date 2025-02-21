//
//  APIClientTests.swift
//  trending-articlesTests
//
//  Created by mahi  on 21/02/2025.
//

import XCTest
@testable import trending_articles

final class APIClientTests: XCTestCase {
    
    var mockURLSession: MockURLSession!
    var apiClient: APIClient<MockTargetType>!

    override func setUpWithError() throws {
        mockURLSession = MockURLSession()
        apiClient = APIClient(urlSession: mockURLSession)
    }

    override func tearDownWithError() throws {
        apiClient = nil
        mockURLSession = nil
    }
    
    func testArticlesFetchSuccess() async throws {
        
        let expected: ArticleResponse = .init(status: "OK", numResults: 1, results: [Article.preview])
        
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .formatted(.yearMonthDayFormatter)
        
        let jsonData = try! encoder.encode(expected)
        
        mockURLSession.data = jsonData
        
        mockURLSession.response = HTTPURLResponse(url: try MockTargetType.articlesFetch.asURL(), statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let response: ArticleResponse = try await apiClient.request(target: .articlesFetch)
        
        XCTAssertEqual(response.results, expected.results)
        XCTAssertEqual(response.status, expected.status)
        XCTAssertEqual(response.numResults, expected.numResults)
    }
    
    func testArticleFetchDecodingError() async throws {
        let expected: ArticleResponse = .init(status: "OK", numResults: 1, results: [Article.preview])
        
        let jsonData = try! JSONEncoder().encode(expected)
        
        mockURLSession.data = jsonData
        
        mockURLSession.response = HTTPURLResponse(url: try MockTargetType.articlesFetch.asURL(), statusCode: 200, httpVersion: nil, headerFields: nil)
        
        do {
            let _ : ArticleResponse = try await apiClient.request(target: .articlesFetch)
            XCTFail("Expected failure, but got success")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .decodingError, "Expected NetworkError.decodingError but got \(error)")
        } catch {
            XCTFail("Expected error")
        }
    }
    
    func testArticleFetchUnauthorizedError() async throws {
        mockURLSession.data = Data()
        mockURLSession.response = HTTPURLResponse(url: try MockTargetType.articlesFetch.asURL(), statusCode: 401, httpVersion: nil, headerFields: nil)
        
        do {
            let _ : ArticleResponse = try await apiClient.request(target: .articlesFetch)
            XCTFail("Expected failure, but got success")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .unauthorized, "Expected NetworkError.decodingError but got \(error)")
        } catch {
            XCTFail("Expected error")
        }
    }

}
