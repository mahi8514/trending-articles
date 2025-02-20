//
//  ArticleListView.swift
//  trending-articles
//
//  Created by mahi  on 19/02/2025.
//

import SwiftUI

struct ArticleListView: View {
    
    @StateObject var viewModel: ArticleListViewModel
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                viewModel.articleAction()
            }
    }
}

#Preview {
    
    struct MockArticleStore: ArticleStore {
        
    }
    
    return ArticleListView(viewModel: .init(articleStore: MockArticleStore(), onArticleClick: nil))
}
