//
//  WalletViewModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 11.06.2024.
//

import Foundation
import SwiftUI

class WalletViewModel: ObservableObject {
    @Published var transactionData = [
        TransactionModel(name: "Bitcoin", time: "11:34 AM", amount: "+ BTC 0.0056", value: "- $950.50", isPositive: true, color: .customOrange, softColor: .softOrange, iconName: "bitcoin", isSystemIcon: false, date: "12 June 2021"),
        TransactionModel(name: "Withdraw", time: "10:12 AM", amount: "", value: "- $2,700.00", isPositive: false, color: .customPurple, softColor: .whiteText, iconName: "arrow.down", isSystemIcon: true, date: "12 June 2021"),
        TransactionModel(name: "Achain", time: "12:30 PM", amount: "+ ACH 1.3000", value: "- $1,223.00", isPositive: true, color: .customBlue, softColor: .softBlue, iconName: "achain", isSystemIcon: false, date: "10 June 2021"),
        TransactionModel(name: "Deposit", time: "08:30 AM", amount: "", value: "+ $250.00", isPositive: true, color: .customMint, softColor: .whiteText, iconName: "arrow.up", isSystemIcon: true, date: "10 June 2021"),
        TransactionModel(name: "Bytecoin", time: "07:13 AM", amount: "+ BCN 2.5400", value: "- $340.00", isPositive: true, color: .customRed, softColor: .softRed, iconName: "bitcoin", isSystemIcon: false, date: "10 June 2021"),
        TransactionModel(name: "Bitcoin", time: "11:34 AM", amount: "+ BTC 0.0056", value: "- $950.50", isPositive: true, color: .customOrange, softColor: .softOrange, iconName: "bitcoin", isSystemIcon: false, date: "12 June 2021"),
        TransactionModel(name: "Withdraw", time: "10:12 AM", amount: "", value: "- $2,700.00", isPositive: false, color: .customPurple, softColor: .whiteText, iconName: "arrow.down", isSystemIcon: true, date: "12 June 2021"),
        TransactionModel(name: "Achain", time: "12:30 PM", amount: "+ ACH 1.3000", value: "- $1,223.00", isPositive: true, color: .customBlue, softColor: .softBlue, iconName: "achain", isSystemIcon: false, date: "8 June 2021"),
        TransactionModel(name: "Deposit", time: "08:30 AM", amount: "", value: "+ $250.00", isPositive: true, color: .customMint, softColor: .whiteText, iconName: "arrow.up", isSystemIcon: true, date: "15 June 2022"),
        TransactionModel(name: "Bytecoin", time: "07:13 AM", amount: "+ BCN 2.5400", value: "- $340.00", isPositive: true, color: .customRed, softColor: .softRed, iconName: "bitcoin", isSystemIcon: false, date: "15 June 2022"),
        TransactionModel(name: "Bytecoin", time: "07:13 AM", amount: "+ BCN 2.5400", value: "- $340.00", isPositive: true, color: .customRed, softColor: .softRed, iconName: "bitcoin", isSystemIcon: false, date: "10 March 2024"),
        TransactionModel(name: "Bitcoin", time: "11:34 AM", amount: "+ BTC 0.0056", value: "- $950.50", isPositive: true, color: .customOrange, softColor: .softOrange, iconName: "bitcoin", isSystemIcon: false, date: "12 January 2022"),
        TransactionModel(name: "Withdraw", time: "10:12 AM", amount: "", value: "- $2,700.00", isPositive: false, color: .customPurple, softColor: .whiteText, iconName: "arrow.down", isSystemIcon: true, date: "16 June 2021"),
        TransactionModel(name: "Achain", time: "12:30 PM", amount: "+ ACH 1.3000", value: "- $1,223.00", isPositive: true, color: .customBlue, softColor: .softBlue, iconName: "achain", isSystemIcon: false, date: "8 June 2021"),
        TransactionModel(name: "Deposit", time: "08:30 AM", amount: "", value: "+ $250.00", isPositive: true, color: .customMint, softColor: .whiteText, iconName: "arrow.up", isSystemIcon: true, date: "15 June 2022"),
        TransactionModel(name: "Bytecoin", time: "07:13 AM", amount: "+ BCN 2.5400", value: "- $340.00", isPositive: true, color: .customRed, softColor: .softRed, iconName: "bitcoin", isSystemIcon: false, date: "15 June 2022"),
    ]
    @Published var currentTab = "History"
    
    func handleTabSelection(_ tab: String) {
        switch tab {
        case "Portfolio":
            print("Portfolio selected")
            // Portfolio sekmesi için yapılacak işlemler
        case "History":
            print("History selected")
            // History sekmesi için yapılacak işlemler
        default:
            break
        }
    }

}
