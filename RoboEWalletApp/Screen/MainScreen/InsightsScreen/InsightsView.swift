//
//  InsightsView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 2.06.2024.
//

import SwiftUI

struct InsightsView: View {
    
    let achainNews : [NewsModel] = [
    NewsModel(isFullWidthNews: true, image: "achain_news", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "3 days ago")
    ]
    
    let bitcoinNews : [NewsModel] = [
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_1", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "2 days ago"),
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_2", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "2 days ago")
    ]
    
    let neoNews : [NewsModel] = [
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_1", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "1 days ago"),
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_2", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "2 days ago"),
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_1", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "3 days ago"),
    NewsModel(isFullWidthNews: false, image: "bitcoin_news_2", text: "Participate in the Corra Finance Airdrop on CoinMarketCap", date: "6 days ago")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                
                backgroundView
                
                VStack {
                    HeaderWithEllipsis(text: "Insights", color: .blackText, backgroundColor: .customWhite)
                    
                    ScrollView{
                        CryptoNews(cryptoName: "Achain", crypto: .achain, newsList: achainNews)
                        
                        CryptoNews(cryptoName: "Bitcoin", crypto: .bitcoin, newsList: bitcoinNews)
                        CryptoNews(cryptoName: "Neo", crypto: .neo, newsList: neoNews)
                        
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            
        }
        
    }
    
    var backgroundView: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.customRed.opacity(0.25),
                Color.customPurple.opacity(0.1),
                Color.appBackground]),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct CryptoNews: View {
    var cryptoName: String
    var crypto : CryptoCurrency
    var newsList : [NewsModel]
    
    var body: some View {
        VStack {
            HStack {
                CircleIcon(cryptoCurrency: crypto, frame: 50)
                Text("\(cryptoName) news")
                    .foregroundStyle(.blackText)
                    .font(.body)
                    .fontWeight(.medium)
                Spacer()
                Text("See all")
                    .foregroundStyle(.customPurple)
                    .font(.headline)
            }
                VStack{
                    ForEach(newsList) {news in
                        News(model: news)
                    }
                }
                .padding(.vertical, 8)
        }
        .padding(.bottom)
    }
}

struct News: View {
    var model : NewsModel
    
    var body: some View {
        
        if model.isFullWidthNews{
            VStack(alignment: .leading){
                Image(model.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(model.text)
                    .foregroundStyle(.blackText)
                    .font(.body)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    
                HStack{
                    Image(systemName: "clock")
                        .fontWeight(.bold)
                        .foregroundStyle(.customLightGray)
                    Text(model.date)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.customLightGray)
                    Spacer()
                }
                .padding(.top, 2)
            }
        } else {
            HStack {
                Image(model.image)
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(model.text)
                        .foregroundStyle(.blackText)
                        .font(.body)
                        .fontWeight(.medium)
                        .lineLimit(3)
                        
                    Spacer()
                    HStack{
                        Image(systemName: "clock")
                            .fontWeight(.bold)
                            .foregroundStyle(.customLightGray)

                        Text(model.date)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.customLightGray)
                        Spacer()
                    }
                }
                .padding(8)
                Spacer()
            }
            .padding(.vertical, 8)
            .frame(height: 120)
        }
        
    }
}

#Preview {
    InsightsView()
}
