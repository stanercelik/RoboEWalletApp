//
//  TabView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 28.05.2024.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("home.fill")
                }
            MarketView()
                .tabItem {
                    Image("home.fill")
                }
        }
    }
}

#Preview {
    TabView()
}
