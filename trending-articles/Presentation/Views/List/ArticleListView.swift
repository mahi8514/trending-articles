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
            
            Section {
                ForEach(viewModel.articles, id: \.id) { article in
                    Button {
                        viewModel.articleAction(article: article)
                    } label: {
                        ArticleListItemView(article: article)
                    }
                    .buttonStyle(.plain)
                }
            } header: {
                dayPickerView
                    .padding(.bottom)
                    .textCase(nil)
            }
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(1.5)
            }
        }
    }
    
    private var dayPickerView: some View {
        Picker("", selection: $viewModel.day) {
            ForEach(viewModel.days, id: \.id) { day in
                Text(day.title)
                    .tag(day)
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    
    struct MockArticleStore: ArticleStore {
        func articles(days: Int) async throws -> ArticleResponse {
            .init(status: "OK", numResults: 1, results: [.preview])
        }
    }
    
    return NavigationStack {
        ArticleListView(viewModel: .init(articleStore: MockArticleStore(), onArticleClick: nil))
    }
}
