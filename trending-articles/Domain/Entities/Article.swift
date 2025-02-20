//
//  Article.swift
//  trending-articles
//
//  Created by Mahin Ibrahim on 20/02/2025.
//

protocol ArticleStore {
    //func fetchArticles() -> [Article]
}

struct ArticleStoreImpl: ArticleStore {
    
    let apiKey: String
    
    init() {
        self.apiKey = APIKeys.articleAPIKey
    }
    
}
