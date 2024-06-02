//
//  widgets.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 2.06.2024.
//

import SwiftUI

// Circle Icon
struct CircleIcon: View {
    let softColor : Color
    let color : Color
    let iconName : String
    let frame : Double
    let padding : Double
    let isSystemIcon : Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(softColor)
                .frame(width: frame, height: frame)
            
            if isSystemIcon {
                Image(systemName: iconName)
                    .foregroundStyle(color)
            } else {
                Image(iconName)
                    .foregroundStyle(color)
            }
        }
        .padding(padding)
    }
}

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

// Corner Radius For Spesific Corner
extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}




