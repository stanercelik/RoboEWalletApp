//
//  PillView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 1.07.2024.
//

import SwiftUI

struct Pill: View {
    let iconColor: Color
    let iconSoftColor: Color
    let iconName: String
    let buttonName: String
    
    var body: some View {
        HStack (spacing: 4) {
            CircleIcon(softColor: iconSoftColor, color: iconColor, iconName: iconName, frame: 40, padding: 6, isSystemIcon: false)
            
            Text(buttonName)
                .foregroundStyle(.blackText)
                .font(.system(size: 15, weight: .regular))
        }
    }
}
