//
//  WalletView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 2.06.2024.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.cyan
                Text("WallettView")
                    .font(.largeTitle)
                    .padding()
            }
            .ignoresSafeArea()
        }
        .navigationTitle("Wallet")
    }
}

#Preview {
    WalletView()
}
