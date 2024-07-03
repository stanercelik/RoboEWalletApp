//
//  CoinDetailViewModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 1.07.2024.
//

import Foundation

class CoinDetailViewModel: ObservableObject {
    @Published var coinHistory: [Double] = []
    private var coinService = CoinServices()

    func fetchCoinHistory(coinId: String, timePeriod: String) {
        coinService.fetchCoinHistory(coinId: coinId, timePeriod: timePeriod) { [weak self] result in
            switch result {
            case .success(let history):
                DispatchQueue.main.async {
                    self?.coinHistory = history
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.coinHistory = []
                }
                print("Failed to fetch coin history: \(error)")
            }
        }
    }
}





