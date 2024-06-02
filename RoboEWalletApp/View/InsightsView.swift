//
//  InsightsView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 2.06.2024.
//

import SwiftUI

struct InsightsView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.indigo
                Text("InsightView")
                    .font(.largeTitle)
                    .padding()
            }
            .ignoresSafeArea()
        }
        
        .navigationTitle("Insights")
        
    }
}

#Preview {
    InsightsView()
}
