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
                VStack{
                    HeaderWithEllipsis(text: "Insights", color: .black)
                    Spacer()
                }
                Text("InsightView")
                    .font(.largeTitle)
                    .padding()
            }
            
        }
        .padding()
        
        .navigationTitle("Insights")
        
    }
}

//SwiftChart

#Preview {
    InsightsView()
}
