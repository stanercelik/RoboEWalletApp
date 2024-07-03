//
//  PriceAlertViewmodel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 11.06.2024.
//

import Foundation

class PriceAlertViewmodel: ObservableObject {
    @Published var btcAlertList : [AlertModel] = [
        AlertModel(isAbove: true, time: "3 mins ago", amount: "1100,00", isActive: true),
        AlertModel(isAbove: false, time: "1 hour ago", amount: "48,000", isActive: false),
        AlertModel(isAbove: false, time: "9 hours ago", amount: "32000", isActive: false)
    ]
    
    @Published var vechainAlertList : [AlertModel] = [
        AlertModel(isAbove: true, time: "3 mins ago", amount: "1100,00", isActive: true),
        AlertModel(isAbove: false, time: "1 hour ago", amount: "48,000", isActive: false),
        AlertModel(isAbove: false, time: "9 hours ago", amount: "32000", isActive: false)
    ]
    
    @Published var neoAlertList : [AlertModel] = [
        AlertModel(isAbove: true, time: "3 mins ago", amount: "1100,00", isActive: true),
        AlertModel(isAbove: false, time: "1 hour ago", amount: "48,000", isActive: false),
        AlertModel(isAbove: false, time: "9 hours ago", amount: "32000", isActive: false)
    ]
}
