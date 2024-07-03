//
//  WalletView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 2.06.2024.
//

import SwiftUI

struct WalletView: View {
    @StateObject private var viewmodel = WalletViewModel()
    @Namespace private var animationNamespace
    @State private var currentTab: String = "History"
    
    
    var body: some View {
        ZStack {
            backgroundView
            
            VStack {
                
                headerView
                pickerView
                
                ScrollView{
                    if currentTab == "History" {
                        VStack() {
                            ForEach(groupedTransactions.keys.sorted(), id: \.self) { date in
                                TransactionRowsWithDate(transactions: groupedTransactions[date]!, date: date)
                            }
                        }
                    } else {
                        VStack(){
                            Text("Portfolio Tab")
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
        Dictionary(grouping: viewmodel.transactionData, by: { $0.date })
    }
    
    var backgroundView: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.customPurple.opacity(0.2), Color.appBackground]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    var headerView: some View {
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
        .padding(.top, 12)
        .padding(.bottom, 32)
    }
    
    var pickerView: some View {
        CustomPickerView(currentTab: $currentTab, tabs: ["Portfolio", "History"], onTabSelected: { tab in
            viewmodel.handleTabSelection(tab)
        }, animationNamespace: animationNamespace,
                         tabPadding: UIScreen.main.bounds.width * 0.12)
    }
}


struct TransactionRowsWithDate: View {
    var transactions: [TransactionModel]
    var date: String
    
    var body: some View {
        VStack {
            HStack {
                Text(date)
                    .foregroundStyle(.customLightGray)
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



#Preview {
    WalletView()
}
