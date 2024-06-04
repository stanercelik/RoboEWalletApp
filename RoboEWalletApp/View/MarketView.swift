//
//  MarketView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 28.05.2024.
//

import SwiftUI

struct MarketView: View {
    
    @State private var searchText: String = ""
    
    let cryptoData = [
        MarketCoinModel(name: "Bitcoin", price: "$32,128.80", change: 2.5, color: .appOrange, softColor: .softOrange, iconName: "bitcoin", marketCap: "893.43"),
        MarketCoinModel(name: "Neo",  price: "$13,221.55", change: 2.2, color: .appMint, softColor: .softMint, iconName: "neo", marketCap: "893.43"),
        MarketCoinModel(name: "Achain", price: "$28,312.22", change: -2.2, color: .appPurple, softColor: .softPurple, iconName: "achain", marketCap: "893.43"),
        MarketCoinModel(name: "Vechain", price: "$14,112.86", change: 2.5, color: .appPurple, softColor: .softPurple, iconName: "vechain", marketCap: "893.43"),
        MarketCoinModel(name: "Vitae", price: "$14,112.86", change: 2.2, color: .appMint, softColor: .softMint, iconName: "vitae", marketCap: "893.43"),
        MarketCoinModel(name: "Bitcoin", price: "$32,128.80", change: 2.5, color: .appOrange, softColor: .softOrange, iconName: "bitcoin", marketCap: "893.43"),
        MarketCoinModel(name: "Neo",  price: "$13,221.55", change: 2.2, color: .appMint, softColor: .softMint, iconName: "neo", marketCap: "893.43"),
        MarketCoinModel(name: "Achain", price: "$28,312.22", change: -2.2, color: .appPurple, softColor: .softPurple, iconName: "achain", marketCap: "893.43"),
        MarketCoinModel(name: "Vechain", price: "$14,112.86", change: 2.5, color: .appPurple, softColor: .softPurple, iconName: "vechain", marketCap: "893.43"),
        MarketCoinModel(name: "Vitae", price: "$14,112.86", change: 2.2, color: .appMint, softColor: .softMint, iconName: "vitae", marketCap: "893.43")
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.softPurple,
                        Color.softBlue.opacity(0.4),
                        Color.marketScreenBackground]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)

                
                VStack(alignment: .center){
                    MarketHeaderView()
                    
                    TextFieldView(searchText: $searchText)
                    
                    SegmentedControlView()
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(cryptoData) { crypto in
                                CryptoRowView(coinModel: crypto)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                    .scrollIndicators(.hidden)
                    
                    Spacer()
                }
                .padding()
            }
            
            
        }
        
        
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}

struct SegmentedControlView: View {
    var body: some View {
        HStack(spacing: 16) {
            SegmentButton(icon: "star", title: "Watchlists", softColor: .softMint, mainColor: .appMint)
            SegmentButton(icon: "arrow.up.right.circle", title: "Trending", softColor: .softBlue, mainColor: .appBlue)
            SegmentButton(icon: "sparkles", title: "Best value", softColor: .softOrange, mainColor: .appOrange)
        }
    }
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
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
            }
            .padding(.vertical, 30)
            .frame(width: UIScreen.main.bounds.width / 3.7)
        }
        .background(Color.white)
        .cornerRadius(25)
        
    }
}



struct TextFieldView: View {
    @Binding var searchText : String
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .padding([.top, .bottom] , 16)
                        .padding( .leading, 6)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $searchText)
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
                        .foregroundColor(.gray)
                        .padding(14)
                }
                .padding(.trailing, 4)
            }
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color.white)
            .cornerRadius(25)
        }
        .padding(.vertical)
    }
}

struct MarketHeaderView: View {
    var body: some View {
        HStack{
            Text("Market")
                .font(.largeTitle)
                .foregroundStyle(.black)
                .bold()
            Spacer()
        }
    }
}

struct CryptoRowView: View {
    var coinModel: MarketCoinModel
    
    var body: some View {
        HStack {
            CircleIcon(softColor: coinModel.softColor, color: coinModel.color, iconName: coinModel.iconName, frame: 50, padding: 8, isSystemIcon: false)
            VStack(alignment: .leading) {
                Text(coinModel.name)
                    .font(.headline)
                Text("\(String(format: "%.1f",  coinModel.change))%")
                    .font(.subheadline)
                    .foregroundColor(coinModel.change > 0 ? .green : .red)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(coinModel.price)")
                    .font(.headline)
                Text("MCap $\(coinModel.marketCap) Bn")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
        
    }
}
