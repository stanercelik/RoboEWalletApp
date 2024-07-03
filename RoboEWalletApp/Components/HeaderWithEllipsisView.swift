//
//  HeaderWithEllipsisView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 1.07.2024.
//

import SwiftUI

struct HeaderWithEllipsis: View {
    var text: String
    var color: Color
    var backgroundColor: Color
    var body: some View {
        HStack (alignment: .center) {
            Text(text)
                .font(.largeTitle)
                .foregroundStyle(color)
                .bold()
            
            Spacer()
            
            CircleIcon(softColor: backgroundColor, color: .blackText, iconName: "ellipsis", frame: 45, padding: 12, isSystemIcon: true)
        }
    }
}
