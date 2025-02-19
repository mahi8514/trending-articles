//
//  Navigatable.swift
//  trending-articles
//
//  Created by mahi  on 20/02/2025.
//

import Foundation

protocol Navigatable {
    
    associatedtype Navigation: Hashable
    
    var path: [Navigation] { get set }
    
}

extension Navigatable {
    
    mutating func push(_ item: Navigation) {
        path.append(item)
    }
    
    mutating func pop() {
        path.removeLast()
    }
    
    mutating func popToRoot() {
        path.removeAll()
    }
}
