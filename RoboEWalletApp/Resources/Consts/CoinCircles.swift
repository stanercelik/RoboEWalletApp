//
//  CoinCircles.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 3.06.2024.
//

import Foundation
import SwiftUI

enum CryptoCurrency {
    case bitcoin
    case neo
    case achain
    case vechain
    case vitae
    
    var softColor: Color {
        switch self {
        case .bitcoin:
            return .softOrange
        case .neo:
              return  .softMint
        case .achain:
               return .softPurple
        case .vechain:
            return .softPurple
        case .vitae:
            return .softMint
        }
    }
    
    var color: Color {
        switch self {
        case .bitcoin:
            return .customOrange
        case .neo:
              return  .customMint
        case .achain:
               return .customPurple
        case .vechain:
            return .customPurple
        case .vitae:
            return .customMint
        }
    }
    
    var iconName: String {
        switch self {
        case .bitcoin:
            return "bitcoin"
        case .neo:
              return  "neo"
        case .achain:
               return "achain"
        case .vechain:
            return "vechain"
        case .vitae:
            return "vitae"
        }
    }
}

struct CoinCircles {
    static let bitcoinCircle = CircleIcon(cryptoCurrency: .bitcoin)
    static let neoCircle = CircleIcon(cryptoCurrency: .neo)
    static let achainCircle = CircleIcon(cryptoCurrency: .achain)
    static let vechainCircle = CircleIcon(cryptoCurrency: .vechain)
    static let vitaeCircle = CircleIcon(cryptoCurrency: .vitae)
}

