//
//  ArticleListViewModel.swift
//  trending-articles
//
//  Created by mahi  on 19/02/2025.
//

import Foundation

final class ArticleListViewModel: ViewModel {
    
    private let articleStore: ArticleStore
    private let onArticleClick: ArticleCompletion?
    
    @Published private(set) var articles: [Article] = []
    
    init(articleStore: ArticleStore, onArticleClick: ArticleCompletion?) {
        self.articleStore = articleStore
        self.onArticleClick = onArticleClick
        super.init()
    }
    
    override func task() async {
        await super.task()
        isLoading = true
        defer {
            isLoading = false
        }
        await fetchArticles()
    }
    
    private func fetchArticles() async {
        do {
            let response = try await articleStore.articles(days: 7)
            self.articles = response.results
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func articleAction(article: Article) {
        onArticleClick?(article)
    }
    
}
