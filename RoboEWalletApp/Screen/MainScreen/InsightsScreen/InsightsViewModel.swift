//
//  InsightsViewModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 11.06.2024.
//

import Foundation


class InsightsViewModel: ObservableObject {
    @Published var achainNews : [NewsModel] = [
    NewsModel(isFullWidthNews: true, image: "achain_news", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "3 days ago")
    ]
    
    @Published var bitcoinNews : [NewsModel] = [
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_1", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "2 days ago"),
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_2", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "2 days ago")
    ]
    
    @Published var neoNews : [NewsModel] = [
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_1", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "1 days ago"),
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_2", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "2 days ago"),
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_1", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "3 days ago"),
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_2", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "6 days ago")
    ]
}
