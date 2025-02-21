//
//  ArticleDetailVMTests.swift
//  trending-articles
//
//  Created by mahi  on 21/02/2025.
//

import XCTest
@testable import trending_articles

@MainActor
final class ArticleDetailViewModelTests: XCTestCase {
    
    private var viewModel: ArticleDetailViewModel!
    
    override func setUpWithError() throws {
        viewModel = .init(article: .preview)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testViewComponentStates() {
        XCTAssertEqual(viewModel.title, Article.preview.type)
        XCTAssertEqual(viewModel.headline, Article.preview.title)
        XCTAssertEqual(viewModel.content, Article.preview.abstract)
        XCTAssertEqual(viewModel.publishedOn, Article.preview.publishedDate)
        XCTAssertEqual(viewModel.publishedBy, Article.preview.byline)
        XCTAssertEqual(viewModel.section, Article.preview.section)
        XCTAssertEqual(viewModel.subSection, Article.preview.subsection)
        XCTAssertEqual(viewModel.originalUrl, URL(string: Article.preview.url))
        XCTAssertEqual(viewModel.mediaUrls, Article.preview.mediaURLs)
    }

}
