//
//  ViewModel.swift
//  trending-articles
//
//  Created by mahi  on 20/02/2025.
//

import Foundation
import Combine

@MainActor
class ViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    @Published var isPresentingAlert: Bool = false
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        setupUI()
        addObservables()
        Task { await task() }
        print("\(String(describing: type(of: self))) Initialised")
    }
    
    func setupUI() { }
    
    func addObservables() { }
    
    func task() async { }
    
    deinit {
        print("\(String(describing: type(of: self))) De-initialised")
    }
    
}
