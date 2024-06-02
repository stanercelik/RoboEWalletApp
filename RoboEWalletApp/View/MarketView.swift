//
//  MarketView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 28.05.2024.
//

import SwiftUI

struct MarketView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.yellow
                Text("MarketView")
                    .font(.largeTitle)
                    .padding()
            }
            .ignoresSafeArea()
        }
        .navigationTitle("Market")
        
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}
