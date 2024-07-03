//
//  AlertModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 11.06.2024.
//

import Foundation
import SwiftUI

class AlertModel: Identifiable, ObservableObject {
    var id = UUID()
    let isAbove: Bool
    let time: String
    let amount: String
    @Published var isActive: Bool
    
    init(isAbove: Bool, time: String, amount: String, isActive: Bool) {
        self.isAbove = isAbove
        self.time = time
        self.amount = amount
        self.isActive = isActive
    }
}
