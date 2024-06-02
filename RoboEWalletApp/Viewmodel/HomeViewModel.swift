//
//  HomeViewModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 2.06.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var isLearnMorePressed: Bool = false
    
    func learnModeButtonPressed() {
        print("Learn More Button Pressed")
        
        isLearnMorePressed = true
    }
}
