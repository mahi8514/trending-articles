//
//  ArticleListViewModel.swift
//  trending-articles
//
//  Created by mahi  on 19/02/2025.
//

import Foundation

final class ArticleListViewModel: ViewModel {
    
    private let onArticleClick: Completion?
    
    init(onArticleClick: Completion?) {
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
