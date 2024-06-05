//
//  TabView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 28.05.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                TabBarItem(selectedTab: $selectedTab, iconName: tab.iconName, selectedIndex: tab.rawValue)
                
                if tab != Tab.allCases.last {
                    Spacer()
                }
            }
        }
        .padding(EdgeInsets(top: 28, leading: 38, bottom: 28, trailing: 38))
        .background(Color.whiteText)
        .roundedCorner(40, corners: [.topLeft, .topRight])
        .shadow(color: .appSecondaryText.opacity(0.2) ,radius: 20)
    }
}

struct Tabs: View {
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    HomeView().tag(0)
                    MarketView(searchText: "").tag(1)
                    WalletView().tag(2)
                    InsightsView().tag(3)
                    ProfileView().tag(4)
                }
                CustomTabBarView(selectedTab: $selectedTab)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}

struct TabBarItem: View {
    @Binding var selectedTab: Int
    var iconName: String
    var selectedIndex: Int
    
    var body: some View {
        Button(action: {
            selectedTab = selectedIndex
        }) {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 28, height: 28)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(selectedTab == selectedIndex ? .blackText : .appSecondaryText)
        }
    }
}

enum Tab: Int, CaseIterable {
    case home = 0
    case market
    case wallet
    case insights
    case profile
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .market: return "chart.bar"
        case .wallet: return "creditcard"
        case .insights: return "doc.plaintext"
        case .profile: return "person"
        }
    }
}
