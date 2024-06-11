//
//  CircleIconComponent.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 6.06.2024.
//

import Foundation
import SwiftUI

struct CircleIcon: View {
    let cryptoCurrency: CryptoCurrency?
    let softColor: Color?
    let color: Color?
    let iconName: String?
    let frame: Double?
    let padding: Double?
    let isSystemIcon: Bool?
    
    init(cryptoCurrency: CryptoCurrency? = nil,
         softColor: Color? = Color.softMint,
         color: Color? = Color.customMint,
         iconName: String? = "alert",
         frame: Double? = 40,
         padding: Double? = 8,
         isSystemIcon: Bool? = false) {
        self.cryptoCurrency = cryptoCurrency
        self.softColor = softColor
        self.color = color
        self.iconName = iconName
        self.frame = frame
        self.padding = padding
        self.isSystemIcon = isSystemIcon
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(cryptoCurrency?.softColor ?? softColor ?? Color.softMint)
                .frame(width: frame ?? 40, height: frame ?? 40)
            
            if isSystemIcon ?? false {
                Image(systemName: cryptoCurrency?.iconName ?? iconName ?? "alert")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: (frame ?? 40) * 0.5, height: (frame ?? 40) * 0.5)
                    .foregroundStyle(cryptoCurrency?.color ?? color ?? Color.customMint)
            } else {
                Image(cryptoCurrency?.iconName ?? iconName ?? "alert")
                    .foregroundStyle(cryptoCurrency?.color ?? color ?? Color.customMint)
            }
        }
        .padding(padding ?? 8)
    }
}
