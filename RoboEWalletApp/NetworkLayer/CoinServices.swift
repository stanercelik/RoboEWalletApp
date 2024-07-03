//
//  CoinServices.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 26.06.2024.
//

import Foundation

class CoinServices {
    func fetchCoins(completion: @escaping (Result<[CoinModel], Error>) -> Void) {
        let parameters: [String: Any] = [
            "referenceCurrencyUuid": "yhjMzLPhuIDl",
            "timePeriod": "24h",
            "tiers": 1,
            "orderBy": "marketCap",
            "orderDirection": "desc",
            "limit": 50,
            "offset": 0
        ]
        
        Networking.shared.networkService.get("coins", parameters: parameters) { (result: Result<CoinResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.data.coins))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchCoinHistory(coinId: String, timePeriod: String, completion: @escaping (Result<[Double], Error>) -> Void) {
        let parameters: [String: Any] = [
            "referenceCurrencyUuid": "yhjMzLPhuIDl",
            "timePeriod": timePeriod
        ]
        
        Networking.shared.networkService.get("coin/\(coinId)/history", parameters: parameters) { (result: Result<CoinHistoryModel, Error>) in
            switch result {
            case .success(let response):
                if let history = response.data.history {
                    let prices = history.compactMap { Double($0.price) }
                    completion(.success(prices))
                } else {
                    print("No history data available")
                    completion(.failure(NetworkError.noData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
