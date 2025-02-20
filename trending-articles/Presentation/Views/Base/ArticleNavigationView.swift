//
//  Untitled.swift
//  trending-articles
//
//  Created by mahi  on 20/02/2025.
//

import SwiftUI

struct ArticleNavigationView: View, Navigatable {
    
    enum Navigation: Hashable {
        case detail(article: Article)
        
        private var id: Int {
            switch self {
            case .detail: return 1
            }
        }
        
        static func == (lhs: ArticleNavigationView.Navigation, rhs: ArticleNavigationView.Navigation) -> Bool {
            lhs.id == rhs.id
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
    
    @State var path: [Navigation] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            rootView
                .navigationDestination(for: Navigation.self) { navigation in
                    switch navigation {
                    case .detail(let article): detailView(article: article)
                    }
                }
        }
    }
    
    private var rootView: some View {
        ArticleListView(viewModel: .init(articleStore: ArticleStoreImpl(), onArticleClick: { article in
            path.append(.detail(article: article))
        }))
    }
    
    private func detailView(article: Article) -> some View {
        ArticleDetailView(viewModel: .init(article: article))
    }
    
}
