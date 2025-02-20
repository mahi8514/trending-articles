//
//  ArticleListViewModel.swift
//  trending-articles
//
//  Created by mahi  on 19/02/2025.
//

import Foundation

final class ArticleListViewModel: ViewModel {
    
    private let onArticleClick: Completion?
    private let articleStore: ArticleStore
    
    init(articleStore: ArticleStore, onArticleClick: Completion?) {
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
        
    }
    
    func articleAction() {
        onArticleClick?()
    }
    
}
