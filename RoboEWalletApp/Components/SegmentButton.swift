//
//  SegmentButton.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 1.07.2024.
//

import SwiftUI

struct SegmentButton: View {
    var icon: String
    var title: String
    var softColor : Color
    var mainColor : Color
    
    var body: some View {
        VStack {
            VStack {
                CircleIcon(softColor: softColor, color: mainColor, iconName: icon, frame: 40, padding: 8, isSystemIcon: true)
                
                Text(title)
                    .foregroundStyle(.blackText)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 26)
            .frame(width: UIScreen.main.bounds.width / 3.7)
        }
        .background(Color.customWhite)
        .cornerRadius(25)
        .shadow(color: .appSecondaryText.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
    }
}

