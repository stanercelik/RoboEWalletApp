//
//  MarketCoinModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 5.06.2024.
//

import Foundation
import SwiftUI

struct MarketCoinModel: Identifiable  {
    var id = UUID()
    var name: String
    var price: String
    var change: Double
    var color : Color
    var softColor : Color
    var iconName : String
    var marketCap : String
    
}
