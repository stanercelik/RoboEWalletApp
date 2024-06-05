//
//  WalletView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 2.06.2024.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.customPurple.opacity(0.1), Color.appBackground]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                WalletHeaderView()
                    .padding(.top, 12)
                    .padding(.bottom, 32)
                
                WalletSegmentedControlView()
                    
                ScrollView {
                    VStack() {
                        ForEach(groupedTransactions.keys.sorted(), id: \.self) { date in
                            TransactionRowsWithDate(transactions: groupedTransactions[date]!, date: date)
                        }
                    }
                }
                .padding(.vertical, 8)
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal)
        }
    }
    
    var groupedTransactions: [String: [TransactionModel]] {
        Dictionary(grouping: transactionData, by: { $0.date })
    }
}


struct WalletHeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("Total Wallet Value")
                    .foregroundStyle(.blackText)
                    .font(.title3)
                
                Text("$29,100.50")
                    .foregroundStyle(.blackText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            Spacer()
        }
    }
}

struct WalletSegmentedControlView: View {
    @State private var currentTab = "History"
    @Namespace private var animationNamespace

    var body: some View {
        HStack(spacing: 0) {
            tabView(title: "Portfolio", isSelected: currentTab == "Portfolio")
                .onTapGesture {
                    withAnimation(.interactiveSpring(
                        response: 0.5,
                        dampingFraction: 0.6,
                        blendDuration: 0.6)) {
                            currentTab = "Portfolio"
                        }
                }

            tabView(title: "History", isSelected: currentTab == "History")
                .onTapGesture {
                    withAnimation(.interactiveSpring(
                        response: 0.5,
                        dampingFraction: 0.6,
                        blendDuration: 0.6)) {
                            currentTab = "History"
                        }
                }
        }
        .padding(4)
        .background(Color.pickerBackground)
        .cornerRadius(40)
    }

    @ViewBuilder
    private func tabView(title: String, isSelected: Bool) -> some View {
        Text(title)
            .font(.headline)
            .fontWeight(.medium)
            .padding(.vertical, 12)
            .padding(.horizontal, 48)
            .background(
                ZStack {
                    if isSelected {
                        Color.whiteText
                            .cornerRadius(40)
                            .matchedGeometryEffect(id: "tabBackground", in: animationNamespace)
                    }
                }
            )
            .foregroundStyle(isSelected ? .blackText : .appSecondaryText)
    }
}

struct TransactionRowsWithDate: View {
    var transactions: [TransactionModel]
    var date: String
    
    var body: some View {
        VStack {
            HStack {
                Text(date)
                .foregroundStyle(.appSecondaryText)
                .font(.title3)
                .fontWeight(.medium)
                .padding(.top, 24)
                .padding(.bottom, 12)
                Spacer()
            }
            
            VStack {
                ForEach(transactions) { transaction in
                    TransactionRowView(transaction: transaction)
                }
            }
        }
    }
}

struct TransactionRowView: View {
    var transaction: TransactionModel
    
    var body: some View {
        HStack {
            CircleIcon(softColor: transaction.softColor, color: transaction.color, iconName: transaction.iconName, frame: 50, padding: 8, isSystemIcon: transaction.isSystemIcon)
            
            VStack(alignment: .leading) {
                Text(transaction.name)
                    .foregroundStyle(.blackText)
                    .font(.headline)
                Text(transaction.time)
                    .font(.subheadline)
                    .foregroundColor(.appSecondaryText)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(transaction.amount)
                    .font(.headline)
                    .foregroundColor(transaction.isPositive ? .customMint : .customRed)
                Text(transaction.value)
                    .font(.subheadline)
                    .foregroundColor(.appSecondaryText)
            }
        }
        
    }
}

let transactionData = [
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

#Preview {
    WalletView()
}
