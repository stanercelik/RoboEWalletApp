//
//  CustomButton.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 6.06.2024.
//

import Foundation
import SwiftUI

// CustomButton
struct CustomButton: View {
    let action: () -> Void
    let text : String
    let width : Double
    let height : Double
    let backgroundColor : Color
    let textColor : Color
    
    var body: some View {
        Button(action: action, label: {
            Text(text)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(textColor)
        })
        .frame(width: width, height: height)
        .background(backgroundColor)
        .cornerRadius(40)
    }
}
