//
//  MarketView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 28.05.2024.
//

import SwiftUI

struct MarketView: View {
    @StateObject private var viewModel = MarketViewModel()
    let cryptoData = [
        MarketCoinModel(name: "Bitcoin", price: "$32,128.80", change: 2.5, color: .customOrange, softColor: .softOrange, iconName: "bitcoin", marketCap: "893.43"),
        MarketCoinModel(name: "Neo",  price: "$13,221.55", change: 2.2, color: .customMint, softColor: .softMint, iconName: "neo", marketCap: "893.43"),
        MarketCoinModel(name: "Achain", price: "$28,312.22", change: -2.2, color: .customPurple, softColor: .softPurple, iconName: "achain", marketCap: "893.43"),
        MarketCoinModel(name: "Vechain", price: "$14,112.86", change: 2.5, color: .customPurple, softColor: .softPurple, iconName: "vechain", marketCap: "893.43"),
        MarketCoinModel(name: "Vitae", price: "$14,112.86", change: 2.2, color: .customMint, softColor: .softMint, iconName: "vitae", marketCap: "893.43"),
        MarketCoinModel(name: "Bitcoin", price: "$32,128.80", change: 2.5, color: .customOrange, softColor: .softOrange, iconName: "bitcoin", marketCap: "893.43"),
        MarketCoinModel(name: "Neo",  price: "$13,221.55", change: 2.2, color: .customMint, softColor: .softMint, iconName: "neo", marketCap: "893.43"),
        MarketCoinModel(name: "Achain", price: "$28,312.22", change: -2.2, color: .customPurple, softColor: .softPurple, iconName: "achain", marketCap: "893.43"),
        MarketCoinModel(name: "Vechain", price: "$14,112.86", change: 2.5, color: .customPurple, softColor: .softPurple, iconName: "vechain", marketCap: "893.43"),
        MarketCoinModel(name: "Vitae", price: "$14,112.86", change: 2.2, color: .customMint, softColor: .softMint, iconName: "vitae", marketCap: "893.43")
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                
                backgroundView

                VStack(alignment: .center){
                    headerView
                    textFieldView
                    segmentedControlView
                    cryptoCoinListView
                    Spacer()
                }
                .padding()
            }
        }
    }
    var backgroundView : some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.customPurple.opacity(0.23),
                Color.softBlue.opacity(0.4),
                Color.appBackground]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    var cryptoCoinListView : some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(cryptoData) { crypto in
                    CryptoRowView(coinModel: crypto)
                }
            }
        }
        .padding(.vertical, 8)
        .scrollIndicators(.hidden)
    }
    
    var segmentedControlView : some View {
        HStack(spacing: 16) {
            SegmentButton(icon: "star", title: "Watchlists", softColor: .softMint, mainColor: .customMint)
            SegmentButton(icon: "arrow.up.right.circle", title: "Trending", softColor: .softBlue, mainColor: .customBlue)
            SegmentButton(icon: "sparkles", title: "Best value", softColor: .softOrange, mainColor: .customOrange)
        }
    }
    
    var textFieldView : some View {
        HStack(alignment: .center) {
            Spacer()
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.appSecondaryText)
                        .padding([.top, .bottom] , 16)
                        .padding( .leading, 6)

                    
                    TextField("Search", text: $viewModel.searchText)
                        .foregroundStyle(.blackText)
                        .padding(2)
                        .padding(.horizontal, 6)
                }
                .padding(.leading, 4)
                
                Button(action: {
                    print("Tapped Filter Button")
                }) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.appSecondaryText)
                        .padding(14)
                }
                .padding(.trailing, 4)
            }
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color.customWhite)
            .cornerRadius(25)
        }
        .padding(.vertical)
    }
    
    var headerView : some View {
        HStack{
            Text("Market")
                .font(.largeTitle)
                .foregroundStyle(.blackText)
                .bold()
            Spacer()
        }
    }
}

#Preview {
    MarketView()
}


struct SegmentButton: View {
    var icon: String
    var title: String
    var softColor : Color
    var mainColor : Color
    
    var body: some View {
        VStack {
            VStack {
                CircleIcon(softColor: softColor, color: mainColor, iconName: icon, frame: 40, padding: 8, isSystemIcon: true)
                
                Text(title)
                    .foregroundStyle(.blackText)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 26)
            .frame(width: UIScreen.main.bounds.width / 3.7)
        }
        .background(Color.customWhite)
        .cornerRadius(25)
        .shadow(color: .appSecondaryText.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
    }
}

struct CryptoRowView: View {
    var coinModel: MarketCoinModel
    
    var body: some View {
        HStack {
            CircleIcon(softColor: coinModel.softColor, color: coinModel.color, iconName: coinModel.iconName, frame: 50, padding: 8, isSystemIcon: false)
            VStack(alignment: .leading) {
                Text(coinModel.name)
                    .foregroundStyle(.blackText)
                    .font(.headline)
                Text("\(String(format: "%.1f",  coinModel.change))%")
                    .font(.subheadline)
                    .foregroundColor(coinModel.change > 0 ? .customMint : .customRed)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(coinModel.price)")
                    .foregroundStyle(.blackText)
                    .font(.headline)
                Text("MCap $\(coinModel.marketCap) Bn")
                    .font(.subheadline)
                    .foregroundColor(.appSecondaryText)
            }
        }
        .padding(.vertical, 4)
        
    }
}
