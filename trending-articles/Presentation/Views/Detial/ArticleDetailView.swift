//
//  ArticleDetailView.swift
//  trending-articles
//
//  Created by mahi  on 21/02/2025.
//

import SwiftUI

struct ArticleDetailView: View {
    
    @StateObject var viewModel: ArticleDetailViewModel
    
    private let horizontalPadding: CGFloat = 16
    
    var body: some View {
        contentView
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    private var contentView: some View {
        GeometryReader { geometry in
            ScrollView {
                if viewModel.mediaUrls.count > 0 {
                    mediaAttachmentSection(urls: viewModel.mediaUrls, width: geometry.size.width - (horizontalPadding * 2))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                VStack(alignment: .leading, spacing: 12) {
                    headlineView
                    newsView
                    if let moreInfoUrl = viewModel.originalUrl {
                        moreInfoURLView(url: moreInfoUrl)
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        authorView
                        if let publishedDate = viewModel.publishedOn {
                            publishedDateView(date: publishedDate)
                        }
                    }
                    .padding(.top, 8)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

extension ArticleDetailView {
    private func mediaAttachmentSection(urls: [URL], width: CGFloat) -> some View {
        TabView {
            ForEach(urls, id: \.self) { url in
                AsyncImageView(url: url)
                    .scaledToFill()
                    .frame(width: abs(width), height: abs(width * 0.5))
            }
        }
        .tabViewStyle(.page)
        .frame(width: abs(width), height: abs(width * 0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
    
    private var headlineView: some View {
        Text(viewModel.headline)
            .font(.headline.bold())
    }
    
    private var newsView: some View {
        Text(viewModel.content)
    }
    
    private func moreInfoURLView(url: URL) -> some View {
        Link(destination: url) {
            Text("More info")
        }
    }
    
    private var authorView: some View {
        HStack(spacing: 2) {
            Image(systemName: "pencil.and.scribble")
            Text(viewModel.publishedBy)
        }
        .font(.caption)
        .foregroundStyle(.secondary)
    }
    
    private func publishedDateView(date: Date) -> some View {
        HStack(spacing: 2) {
            Image(systemName: "calendar")
            Text(date, style: .date)
        }
        .font(.caption)
        .foregroundStyle(.secondary)
    }
}

#Preview {
    NavigationStack {
        ArticleDetailView(viewModel: .init(article: .preview))
    }
}
