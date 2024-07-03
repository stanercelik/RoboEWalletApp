//
//  CoinDetailView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 12.06.2024.
//

import SwiftUI
import Charts

struct CoinDetailView: View {
    var coin: CoinModel
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTimePeriod: String = "24h"
    @Namespace private var animationNamespace
    @StateObject private var viewModel = CoinDetailViewModel()
    
    var body: some View {
        ZStack {
            backgroundView
            
            VStack{
                headerView
                    .padding(.horizontal)
                priceView
                    .padding(.bottom)
                
                ScrollView {
                    VStack(alignment: .center, spacing: 16) {
                        historyView
                        
                        if !viewModel.coinHistory.isEmpty {
                            ChartView(history: viewModel.coinHistory)
                                .frame(height: UIScreen.main.bounds.height * 0.25)
                                .padding()
                        } else {
                            Text("No data available")
                                .frame(height: UIScreen.main.bounds.height * 0.25)
                                .padding()
                        }
                        
                        buttonsView
                        
                        VStack(alignment: .leading, spacing: 24) {
                            HStack {
                                Text("Market Statistics")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            
                            HStack{
                                Text("Market capitalization:")
                                    .foregroundStyle(.appSecondaryText)
                                Spacer()
                                Text(coin.marketCap ?? "No Data")
                                    .fontWeight(.semibold)
                            }
                                .padding(.horizontal, 16)
                            
                            HStack{
                                Text("Circulating ")
                                    .foregroundStyle(.appSecondaryText)
                                Spacer()
                                Text(coin.volume ?? "No Data")
                                    .fontWeight(.semibold)
                            }
                                .padding(.horizontal, 16)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2)
                        .background(.customWhite)
                        .roundedCorner(50, corners: [.topLeft, .topRight])
                        .padding(.top)
                        
                        
                    }
                    .padding(.horizontal, 16)
                    .navigationBarTitle(Text(coin.name), displayMode: .inline)
                    .onAppear {
                        viewModel.fetchCoinHistory(coinId: coin.id, timePeriod: selectedTimePeriod)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    var backgroundView: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.softOrange.opacity(0.9),
                Color.customPurple.opacity(0.12),
                Color.appBackground]),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    var buttonsView: some View {
        HStack(alignment: .center, spacing: 16){
            CustomButton(action: {
                print("Tapped Set Alert")
            }, text: "Set Alert", width: 150, height: 50, backgroundColor: .customWhite, textColor: .customPurple)
            
            CustomButton(action: {
                print("Tapped Buy Now")
            }, text: "Buy Now", width: 150, height: 50, backgroundColor: .loginButton, textColor: .customWhite)
        }
        .shadow(color: .customLightGray.opacity(0.3), radius: 10, x: 0, y: 5)
    }
    
    var headerView: some View {
        HStack {
            CircleIcon(softColor: .customWhite, color: .blackText, iconName: "arrow.left", frame: 50, isSystemIcon: true, imageFrame: 50)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer()
            Text("\(coin.name) (\(coin.code))")
                .font(.headline)
                .fontWeight(.semibold)
            Spacer()
            CircleIcon(softColor: .customWhite, color: .blackText, iconName: "ellipsis", frame: 50, isSystemIcon: true, imageFrame: 50)
        }
    }
    
    var priceView: some View {
        VStack {
            Text("$\(coin.price)")
                .font(.title)
                .fontWeight(.semibold)
            Text("\(coin.change >= 0 ? "+" : "")\(String(format: "%.1f",  coin.change))%")
                .font(.headline)
                .foregroundColor(coin.change >= 0 ? .customMint : .customRed)
        }
    }
    
    var historyView: some View {
        HStack {
            Spacer()
            CustomPickerView(currentTab: $selectedTimePeriod, tabs: ["24h", "7d", "1y", "5y"], onTabSelected: { tab in
                handleTabSelection(tab)
            }, animationNamespace: animationNamespace, tabHeight: 52, tabPadding: UIScreen.main.bounds.width * 0.07)
            Spacer()
        }
    }
    
    private func handleTabSelection(_ tab: String) {
        viewModel.fetchCoinHistory(coinId: coin.id, timePeriod: tab)
    }
}

struct DetailButtonView: View {
    
    let text: String
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Text(text)
                
        })
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView(coin: CoinModel(
            id: "1",
            name: "Bitcoin",
            code: "BTC",
            price: "34000.00",
            change: 2.5,
            color: Color(hex: "#f7931a"),
            softColor: Color(hex: "#f7931a").opacity(0.2),
            iconName: "bitcoin",
            sparkline: [34000, 33500, 34500],
            rank: 1,
            marketCap: "640B"
        ))
    }
}
