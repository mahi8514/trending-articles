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
        contentView
            .navigationTitle("Most popular")
            .alert(isPresenting: $viewModel.isPresentingAlert, item: $viewModel.alertItem)
    }
    
    private var contentView: some View {
        List {
            
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
    }
}

#Preview {
    
    struct MockArticleStore: ArticleStore {
        func articles(days: Int) async throws -> ArticleResponse {
            .init(status: "OK", numResults: 1, results: [])
        }
    }
    
    return ArticleListView(viewModel: .init(articleStore: MockArticleStore(), onArticleClick: nil))
}
