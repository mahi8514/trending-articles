//
//  ArticleListItemView.swift
//  trending-articles
//
//  Created by mahi  on 21/02/2025.
//

import SwiftUI

struct ArticleListItemView: View {
    
    let article: Article
    
    var body: some View {
        HStack(spacing: 2) {
            HStack(spacing: 8) {
                articleImageView(url: article.thumbnailURL)
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(article.title)
                        .lineLimit(2)
                    Text(article.abstract)
                        .lineLimit(2)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 2) {
                            Image(systemName: "pencil.and.scribble")
                            Text(article.byline)
                        }
                        HStack(spacing: 2) {
                            Image(systemName: "calendar")
                            Text(article.publishedDate, style: .date)
                        }
                    }
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }
            }
            Spacer()
            DisclosureIndicatorView()
        }
    }
    
    @ViewBuilder private func articleImageView(url: URL?) -> some View {
        if let url {
            AsyncImageView(url: url)
        } else {
            Image(systemName: "circle.slash")
                .font(.title2)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ArticleListItemView(article: .preview)
}


