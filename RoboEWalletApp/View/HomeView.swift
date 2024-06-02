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
            
            HStack (alignment: .center){
                Text("Home")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .bold()
                
                Spacer()
                
                CircleIcon(softColor: .white, color: .black, iconName: "ellipsis", frame: 45, padding: 12, isSystemIcon: true)
            }
            
            HStack (alignment: .top){
                VStack (alignment: .leading){
                    Text("Affiliate program")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                    
                    CustomButton(action: viewmodel.learnModeButtonPressed, text: "Learn More", width: 140, height: 42, backgroundColor: .white, textColor: .black)
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
            .background(Color.homeScreenBaseBackground)
            .roundedCorner(40, corners: [.topLeft, .topRight])
        }
        
        .ignoresSafeArea()
    }
}

struct TrendingView : View {
    let trends = [
        TrendModel(name: "Bitcoin", code: "BTC", price: "$32,128.80", change: 2.5, color: .appOrange, softColor: .softOrange, iconName: "bitcoin"),
        TrendModel(name: "Neo", code: "NEO", price: "$13,221.55", change: 2.2, color: .appMint, softColor: .softMint, iconName: "neo"),
        TrendModel(name: "Achain", code: "ACT", price: "$28,312.22", change: -2.2, color: .appPurple, softColor: .softPurple, iconName: "achain"),
        TrendModel(name: "Vechain", code: "VCH", price: "$14,112.86", change: 2.5, color: .appPurple, softColor: .softPurple, iconName: "vechain"),
        TrendModel(name: "Vitae", code: "VTA", price: "$14,112.86", change: 2.2, color: .appMint, softColor: .softMint, iconName: "vitae")
    ]
    var body: some View {
        VStack (alignment: .leading){
            Text("Trending")
                .font(.title)
                .fontWeight(.medium)
                .padding()
            
            ScrollView{
                ForEach(trends, id: \.name) { trend in
                    TrendRow(trend: trend)
                }
            }
            
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
                    .font(.headline)
                Text(trend.code)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 6)
            Spacer()
            VStack(alignment: .trailing) {
                Text(trend.price)
                    .font(.headline)
                Spacer()
                Text("\(trend.change >= 0 ? "+" : "")\(String(format: "%.1f",  trend.change))%")
                    .font(.subheadline)
                    .foregroundColor(trend.change >= 0 ? .green : .red)
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
                Pill(iconColor: .appRed, iconSoftColor: .softRed, iconName: "calculator_icon", buttonName: "Calculator")
                
                Pill(iconColor: .appOrange, iconSoftColor: .softOrange, iconName: "convert_icon", buttonName: "Convert")
            }
            Spacer()
            VStack(alignment: .leading){
                Pill(iconColor: .appBlue, iconSoftColor: .softBlue, iconName: "compare_icon", buttonName: "Compare")
                
                Pill(iconColor: .appPurple, iconSoftColor: .softPurple, iconName: "price_alert_icon", buttonName: "Price Alert")
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
                .font(.system(size: 15, weight: .regular))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
