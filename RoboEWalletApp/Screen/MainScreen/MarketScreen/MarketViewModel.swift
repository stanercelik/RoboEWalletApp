//
//  MarketViewModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 5.06.2024.
//

import Foundation
import SwiftUI

class MarketViewModel: ObservableObject {
    @Published var searchText: String = ""
    
    func filterButtonPressed() {
        print("Filter Button Pressed")
    }
}
