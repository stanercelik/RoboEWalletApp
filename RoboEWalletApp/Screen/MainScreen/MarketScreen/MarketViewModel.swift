//
//  MarketViewModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 5.06.2024.
//

import Foundation
import SwiftUI
import Combine

class MarketViewModel: ObservableObject {
    @Published var searchText: String = "" {
        didSet {
            filterCoins()
        }
    }
    @Published var coins = [CoinModel]()
    @Published var filteredCoins = [CoinModel]()
    
    private var coinService = CoinServices()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchTrends()
        setupSearchListener()
    }
    
    func fetchTrends() {
        coinService.fetchCoins { [weak self] result in
            switch result {
            case .success(let coins):
                DispatchQueue.main.async {
                    self?.coins = coins
                    self?.filterCoins()
                }
            case .failure(let error):
                print("Failed to fetch trends: \(error)")
            }
        }
    }
    
    private func setupSearchListener() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.filterCoins()
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins() {
        if searchText.isEmpty {
            filteredCoins = coins
        } else {
            filteredCoins = coins.filter { coin in
                coin.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func filterButtonPressed() {
        print("Filter Button Pressed")
    }
}
