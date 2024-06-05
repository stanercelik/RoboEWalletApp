//
//  HomeView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 28.05.2024.
//

import SwiftUI


struct HomeView: View {
    @StateObject private var viewmodel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                HeaderView(viewmodel: viewmodel)
                BaseView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct BackgroundView : View {
    var body: some View {
        Color.homeScreenBackground
            .ignoresSafeArea()
    }
}

struct HeaderView : View {
    
    var viewmodel : HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HeaderWithEllipsis(text: "Home", color: .whiteText)
            
            HStack (alignment: .top){
                VStack (alignment: .leading){
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
}

struct BaseView : View {
    var body: some View {
        VStack {
            Spacer()
            VStack (alignment: .leading){
                ButtonsView()
                TrendingView()
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.64)
            .background(Color.appBackground)
            .roundedCorner(40, corners: [.topLeft, .topRight])
        }
        .padding(.vertical, 8)
        .ignoresSafeArea()
    }
}

struct TrendingView : View {
    let trends = [
        TrendModel(name: "Bitcoin", code: "BTC", price: "$32,128.80", change: 2.5, color: .customOrange, softColor: .softOrange, iconName: "bitcoin"),
        TrendModel(name: "Neo", code: "NEO", price: "$13,221.55", change: 2.2, color: .customMint, softColor: .softMint, iconName: "neo"),
        TrendModel(name: "Achain", code: "ACT", price: "$28,312.22", change: -2.2, color: .customPurple, softColor: .softPurple, iconName: "achain"),
        TrendModel(name: "Vechain", code: "VCH", price: "$14,112.86", change: 2.5, color: .customPurple, softColor: .softPurple, iconName: "vechain"),
        TrendModel(name: "Vitae", code: "VTA", price: "$14,112.86", change: 2.2, color: .customMint, softColor: .softMint, iconName: "vitae")
    ]
    var body: some View {
        VStack (alignment: .leading){
            Text("Trending")
                .foregroundStyle(Color.blackText)
                .font(.title)
                .fontWeight(.medium)
                .padding(.horizontal)
                .padding(.top, 8)
            
            ScrollView{
                ForEach(trends, id: \.name) { trend in
                    TrendRow(trend: trend)
                }
            }
            .scrollIndicators(.hidden)
            
        }
    }
}

struct TrendRow: View {
    var trend: TrendModel
    
    var body: some View {
        HStack {
            CircleIcon(softColor: trend.softColor, color: trend.color, iconName: trend.iconName, frame: 40, padding: 0, isSystemIcon: false)
            VStack(alignment: .leading) {
                Text(trend.name)
                    .foregroundStyle(Color.blackText)
                    .font(.headline)
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
                Text("\(trend.change >= 0 ? "+" : "")\(String(format: "%.1f",  trend.change))%")
                    .font(.subheadline)
                    .foregroundColor(trend.change >= 0 ? .customMint : .customRed)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
    }
}

struct ButtonsView : View {
    var body: some View{
        HStack(){
            VStack(alignment: .leading){
                Pill(iconColor: .customRed, iconSoftColor: .softRed, iconName: "calculator_icon", buttonName: "Calculator")
                    .gesture(TapGesture()
                        .onEnded({ _ in
                            print("sad")
                        }))
                
                Pill(iconColor: .customOrange, iconSoftColor: .softOrange, iconName: "convert_icon", buttonName: "Convert")
            }
            Spacer()
            VStack(alignment: .leading){
                Pill(iconColor: .customBlue, iconSoftColor: .softBlue, iconName: "compare_icon", buttonName: "Compare")
                
                Pill(iconColor: .customPurple, iconSoftColor: .softPurple, iconName: "price_alert_icon", buttonName: "Price Alert")
            }
        }
        .padding(.init(top: 24, leading: 32, bottom: 0, trailing: 52))
    }
}

struct Pill : View {
    let iconColor: Color
    let iconSoftColor : Color
    let iconName : String
    let buttonName : String
    
    var body: some View {
        HStack (spacing: 4){
            CircleIcon(softColor: iconSoftColor, color: iconColor, iconName: iconName, frame: 40, padding: 6, isSystemIcon: false)
            
            Text(buttonName)
                .foregroundStyle(.blackText)
                .font(.system(size: 15, weight: .regular))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HeaderWithEllipsis: View {
    var text : String
    var color : Color
    var body: some View {
        HStack (alignment: .center){
            Text(text)
                .foregroundStyle(.whiteText)
                .font(.largeTitle)
                .foregroundStyle(color)
                .bold()
            
            Spacer()
            
            CircleIcon(softColor: .whiteText, color: .blackText, iconName: "ellipsis", frame: 45, padding: 12, isSystemIcon: true)
        }
    }
}


// EnviromentObject
// Enviroment
// Ekrandan ekrana data taşıma
