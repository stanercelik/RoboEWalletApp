//
//  TransactionModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 5.06.2024.
//

import Foundation
import SwiftUI

struct TransactionModel : Identifiable {
    var id = UUID()
    var name: String
    var time: String
    var amount: String
    var value: String
    var isPositive: Bool
    var color: Color
    var softColor : Color
    var iconName : String
    var isSystemIcon : Bool
    var date : String
}
