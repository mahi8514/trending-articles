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
    ArticleListView(viewModel: .init(onArticleClick: nil))
}
