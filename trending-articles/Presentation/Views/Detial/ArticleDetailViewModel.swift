//
//  ArticleDetailViewModel.swift
//  trending-articles
//
//  Created by mahi  on 21/02/2025.
//

import Foundation

final class ArticleDetailViewModel: ViewModel {
    
    private let article: Article
    
    @Published private(set) var title: String = ""
    @Published private(set) var headline: String = ""
    @Published private(set) var content: String = ""
    @Published private(set) var publishedOn: Date?
    @Published private(set) var publishedBy: String = ""
    @Published private(set) var section: String = ""
    @Published private(set) var subSection: String = ""
    @Published private(set) var originalUrl: URL?
    @Published private(set) var mediaUrls: [URL] = []
    
    init(article: Article) {
        self.article = article
        super.init()
    }
    
    override func setupUI() {
        super.setupUI()
        title = article.type
        headline = article.title
        content = article.abstract
        publishedOn = article.publishedDate
        publishedBy = article.byline
        section = article.section
        subSection = article.subsection
        originalUrl = URL(string: article.url)
        mediaUrls = article.mediaURLs
    }
    
}
