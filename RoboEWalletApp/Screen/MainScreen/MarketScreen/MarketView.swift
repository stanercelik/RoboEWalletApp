//
//  MarketView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 28.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct MarketView: View {
    @StateObject private var viewModel = MarketViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                
                backgroundView
                
                ScrollView{
                    VStack(alignment: .center){
                        textFieldView
                        segmentedControlView
                        cryptoCoinListView
                        Spacer()
                    }
                    .padding()
                }
                
            }.navigationBarTitle("Market", displayMode: .large)
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
                ForEach(viewModel.filteredCoins) { coin in
                    CryptoRowView(coinModel: coin)
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

struct CryptoRowView: View {
    var coinModel: CoinModel
    
    var body: some View {
        NavigationLink(destination: CoinDetailView(coin: coinModel)){
            HStack {
                AsyncImage(url: URL(string: coinModel.iconName)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    } else if phase.error != nil {
                        ZStack {
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 40, height: 40)
                            Text(coinModel.name.prefix(1))
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                    } else {
                        ProgressView()
                            .frame(width: 40, height: 40)
                    }
                }
                VStack(alignment: .leading) {
                    Text(coinModel.name)
                        .frame(width: 120, alignment: .leading)
                        .foregroundStyle(.blackText)
                        .font(.headline)
                        .lineLimit(1)
                    Text("\(String(format: "%.1f",  coinModel.change))%")
                        .font(.subheadline)
                        .foregroundColor(coinModel.change > 0 ? .customMint : .customRed)
                }
                
                if let sparkline = coinModel.sparkline {
                    LineChart(data: sparkline, change: coinModel.change)
                        .frame(width: 50, height: 30, alignment: .center)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("$ \(coinModel.price)")
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                        .foregroundStyle(.blackText)
                        .font(.headline)
                    Text(String(coinModel.marketCap!))
                        .font(.caption)
                        .foregroundColor(.appSecondaryText)
                }
            }
            .padding(.vertical, 8)
        }
    }
}


struct LineChart: View {
    var data: [Double]
    var change: Double

    var body: some View {
        let lineColor = change > 0 ? Color.customMint : Color.customRed
        let minValue = data.min() ?? 0
        let maxValue = data.max() ?? 1

        Chart {
            ForEach(data.indices, id: \.self) { index in
                LineMark(
                    x: .value("Index", index),
                    y: .value("Value", data[index])
                )
                .foregroundStyle(lineColor)
            }
        }
        .chartYScale(domain: minValue...maxValue)
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .frame(height: 30)
    }
}
