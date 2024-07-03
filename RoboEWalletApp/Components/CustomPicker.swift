//
//  CustomPicker.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 26.06.2024.
//

import SwiftUI

struct CustomPickerView: View {
    @Binding var currentTab: String
    var tabs: [String]
    var onTabSelected: (String) -> Void
    var animationNamespace: Namespace.ID
    var tabHeight: CGFloat = 40
    var tabPadding: CGFloat = 16
    
    var body: some View {
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    tabView(title: tab, isSelected: currentTab == tab)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(
                                response: 0.5,
                                dampingFraction: 0.6,
                                blendDuration: 0.6)) {
                                    currentTab = tab
                                    onTabSelected(tab)
                                }
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
            .padding(.vertical, tabPadding)
            .padding(.horizontal, tabPadding)
            .frame(height: tabHeight)
            .background(
                ZStack {
                    if isSelected {
                        Color.customWhite
                            .cornerRadius(40)
                            .matchedGeometryEffect(id: "tabBackground", in: animationNamespace)
                    }
                }
            )
            .foregroundStyle(isSelected ? .blackText : .customLightGray)
    }
}


