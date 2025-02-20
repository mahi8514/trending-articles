//
//  AsyncImageView.swift
//  trending-articles
//
//  Created by mahi  on 21/02/2025.
//

import SwiftUI

struct AsyncImageView: View {
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .padding()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "exclamationmark.icloud")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .padding()
            @unknown default:
                EmptyView()
            }
        }
    }
}
