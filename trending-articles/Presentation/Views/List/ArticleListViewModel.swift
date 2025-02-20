//
//  ArticleListViewModel.swift
//  trending-articles
//
//  Created by mahi  on 19/02/2025.
//

import Foundation

final class ArticleListViewModel: ViewModel {
    
    enum Day: Int, CaseIterable, Identifiable {
        case one = 1
        case seven = 7
        case thirty = 30
        
        var title: String {
            switch self {
            case .one:
                return "Last 1 Day"
            case .seven:
                return "Last 7 Days"
            case .thirty:
                return "Last 30 Days"
            }
        }
        
        var id: Int { rawValue }
    }
    
    private let articleStore: ArticleStore
    private let onArticleClick: ArticleCompletion?
    
    @Published private(set) var articles: [Article] = []
    @Published var days: [Day] = Day.allCases
    @Published var day: Day = .one
    
    init(articleStore: ArticleStore, onArticleClick: ArticleCompletion?) {
        self.articleStore = articleStore
        self.onArticleClick = onArticleClick
        super.init()
    }
    
    override func addObservables() {
        super.addObservables()
        $day
            .dropFirst()
            .sink { [weak self] day in
                Task { await self?.fetchArticles(day: day) }
            }
            .store(in: &cancellables)
    }
    
    override func task() async {
        await super.task()
        await fetchArticles(day: day)
    }
    
    private func fetchArticles(day: Day) async {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            let response = try await articleStore.articles(days: day.rawValue)
            self.articles = response.results
        } catch {
            presentAlert(title: "Something went wrong", message: error.localizedDescription)
        }
    }
    
    func articleAction(article: Article) {
        onArticleClick?(article)
    }
    
    private func presentAlert(title: String, message: String) {
        alertItem = .init(title: title, message: message, actions: nil)
        isPresentingAlert = true
    }
    
}
