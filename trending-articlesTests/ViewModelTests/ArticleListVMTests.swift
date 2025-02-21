//
//  ArticleListVMTests.swift
//  trending-articlesTests
//
//  Created by mahi  on 21/02/2025.
//

import XCTest
@testable import trending_articles

@MainActor
final class ArticleListVMTests: XCTestCase {
    
    private var mockArticleStore: MockArticleStore!
    private var viewModel: ArticleListViewModel!

    override func setUpWithError() throws {
        mockArticleStore = .init()
        viewModel = ArticleListViewModel(articleStore: mockArticleStore, onArticleClick: nil)
    }

    override func tearDownWithError() throws {
        mockArticleStore = nil
        viewModel = nil
    }
    
    func testStates() {
        XCTAssertEqual(viewModel.articles, [])
        XCTAssertEqual(viewModel.days, ArticleListViewModel.Day.allCases)
        XCTAssertEqual(viewModel.day, .one)
    }
    
    func testFetchSuccess() async throws {
        let expected = ArticleResponse(status: "OK", numResults: 1, results: [.preview])
        mockArticleStore.mockResponse = expected
        await viewModel.task()
        XCTAssertEqual(viewModel.articles, expected.results)
    }
    
    func testFetchFailure() async throws {
        
        mockArticleStore.mockError = NetworkError.badRequest
        
        await viewModel.task()
        
        XCTAssertEqual(viewModel.articles, [])
        XCTAssertTrue(viewModel.isPresentingAlert)
        
        XCTAssertEqual(viewModel.alertItem?.title, "Something went wrong")
        XCTAssertEqual(viewModel.alertItem?.message, NetworkError.badRequest.localizedDescription)
    }
    
    func testDayChangeCombine() {
        let expectation = XCTestExpectation(description: "Fetch articles called")
        mockArticleStore.mockResponse = ArticleResponse(status: "0", numResults: 1, results: [.preview])
        
        viewModel.$articles
            .dropFirst()
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &viewModel.cancellables)
        
        viewModel.day = .seven
        
        wait(for: [expectation], timeout: 1.0)
    }

}

final class MockArticleStore: ArticleStore {

    var mockResponse: ArticleResponse?
    var mockError: NetworkError?

    func articles(days: Int) async throws -> ArticleResponse {
        if let error = mockError {
            throw error
        }
        return mockResponse ?? .init(status: "", numResults: 0, results: [])
    }
}
