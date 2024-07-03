//
//  HomeView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 28.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSVGKitPlugin
import SwiftUICharts


struct HomeView: View {
    @StateObject private var viewmodel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundView
                headerView
                baseView
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    var backgroundView: some View {
        Color.homeScreenBackground
            .ignoresSafeArea()
    }
    
    var headerView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HeaderWithEllipsis(text: "Home", color: .whiteText, backgroundColor: .customWhite)
            
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Affiliate program")
                        .font(.title2)
                        .foregroundStyle(.whiteText)
                        .fontWeight(.semibold)
                    
                    CustomButton(action: viewmodel.learnModeButtonPressed, text: "Learn More", width: 140, height: 42, backgroundColor: .whiteText, textColor: .blackText)
                }
                .padding(.top, 20)
                Image("home_illustration")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    
    var baseView: some View {
        VStack {
            Spacer()
            VStack (alignment: .leading) {
                buttonsView
                trendingView
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.64)
            .background(Color.appBackground)
            .roundedCorner(40, corners: [.topLeft, .topRight])
        }
        .padding(.vertical, 8)
        .ignoresSafeArea()
    }
    
    var trendingView: some View {
        VStack(alignment: .leading) {
            Text("Trending")
                .foregroundStyle(Color.blackText)
                .font(.title)
                .fontWeight(.medium)
                .padding(.horizontal)
                .padding(.top, 8)
            
            ScrollView {
                ForEach(viewmodel.trends) { trend in
                    TrendRow(trend: trend)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    var buttonsView: some View {
        HStack {
            VStack(alignment: .leading) {
                Pill(iconColor: .customRed, iconSoftColor: .softRed, iconName: "calculator_icon", buttonName: "Calculator")
                    .gesture(TapGesture().onEnded({ _ in
                        print("sad")
                    }))
                NavigationLink(destination: ConverterView().navigationBarBackButtonHidden(true)) {
                    Pill(iconColor: .customOrange, iconSoftColor: .softOrange, iconName: "convert_icon", buttonName: "Convert")
                }
            }
            Spacer()
            VStack(alignment: .leading) {
                Pill(iconColor: .customBlue, iconSoftColor: .softBlue, iconName: "compare_icon", buttonName: "Compare")
                
                NavigationLink(destination: PriceAlertView().navigationBarBackButtonHidden(true)) {
                    Pill(iconColor: .customPurple, iconSoftColor: .softPurple, iconName: "price_alert_icon", buttonName: "Price Alert")
                }
            }
        }
        .padding(.init(top: 24, leading: 32, bottom: 0, trailing: 52))
    }
}

struct TrendRow: View {
    var trend: CoinModel
    
    var body: some View {
        NavigationLink(destination: CoinDetailView(coin: trend)) {
            HStack {
                AsyncImage(url: URL(string: trend.iconName)) { phase in
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
                            Text(trend.name.prefix(1))
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                    } else {
                        ProgressView()
                            .frame(width: 40, height: 40)
                    }
                }
                VStack(alignment: .leading) {
                    Text(trend.name)
                        .foregroundStyle(.blackText)
                        .font(.headline)
                        .lineLimit(1)
                    Text(trend.code)
                        .font(.subheadline)
                        .foregroundColor(.appSecondaryText)
                }
                .padding(.leading, 6)
                Spacer()
                VStack(alignment: .trailing) {
                    Text(trend.price)
                        .foregroundStyle(.blackText)
                        .font(.headline)
                    Spacer()
                    Text("\(trend.change >= 0 ? "+" : "")\(String(format: "%.1f", trend.change))%")
                        .font(.subheadline)
                        .foregroundColor(trend.change >= 0 ? .customMint : .customRed)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
        }
    }
}



#Preview {
    HomeView()
}
