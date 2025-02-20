//
//  Untitled.swift
//  trending-articles
//
//  Created by mahi  on 20/02/2025.
//

import SwiftUI

struct ArticleNavigationView: View, Navigatable {
    
    enum Navigation {
        case detail
    }
    
    @State var path: [Navigation] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            rootView
                .navigationDestination(for: Navigation.self) { navigation in
                    switch navigation {
                    case .detail: detailView()
                    }
                }
        }
    }
    
    private var rootView: some View {
        ArticleListView(viewModel: .init(articleStore: ArticleStoreImpl(), onArticleClick: {
            path.append(.detail)
        }))
    }
    
    private func detailView() -> some View {
        Text("Detail View")
    }
    
}
