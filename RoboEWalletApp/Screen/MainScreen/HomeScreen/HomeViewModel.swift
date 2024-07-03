//
//  HomeViewModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 2.06.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var trends = [CoinModel]()
    
    private var coinService = CoinServices()
    
    init() {
        fetchTrends()
    }
    
    func fetchTrends() {
        coinService.fetchCoins { [weak self] result in
            switch result {
            case .success(let coins):
                DispatchQueue.main.async {
                    self?.trends = coins.sorted(by: { $0.rank! < $1.rank! }).prefix(15).map { $0 }
                }
            case .failure(let error):
                print("Failed to fetch trends: \(error)")
            }
        }
    }
    
    func learnModeButtonPressed() {
        print("Learn More Button Pressed")
    }
    
    func calculateButtonPressed() {
        print("Calculate Button Pressed")
    }
    
    func compareButtonPressed() {
        print("Compare Button Pressed")
    }
    
    func convertButtonPressed() {
        print("Convert Button Pressed")
    }
    
    func trendAlertButtonPressed() {
        print("Trend Alert Button Pressed")
    }
}
