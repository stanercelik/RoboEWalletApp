//
//  CoinHistoryModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 1.07.2024.
//

import Foundation

struct CoinHistoryModel: Decodable {
    let status: String
    let data: CoinHistoryData
}

struct CoinHistoryData: Decodable {
    let change: String?
    let history: [HistoryPoint]?
}

struct HistoryPoint: Decodable {
    let price: String
    let timestamp: Int
}
