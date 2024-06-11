//
//  RoboEWalletAppApp.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 28.05.2024.
//

import SwiftUI

@main
struct RoboEWalletAppApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.font, Font.custom("Poppins", size: 14))
        }
    }
}

