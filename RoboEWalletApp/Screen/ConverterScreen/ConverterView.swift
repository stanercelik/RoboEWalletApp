//
//  ConverterView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 12.06.2024.
//

import SwiftUI

struct ConverterView: View {
    var body: some View {
        ZStack {
            backgroundView
            VStack {
                HeaderWithBackButton()
                converterTextView
                    .padding(.horizontal)
                baseView
                
                Spacer()
            }
            .ignoresSafeArea(edges: .bottom)
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    var backgroundView: some View{
        LinearGradient(
            gradient: Gradient(colors: [
                Color.customRed.opacity(0.3),
                Color.customOrange.opacity(0.03),
                Color.customPurple.opacity(0.1),
                Color.appBackground]),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    var converterTextView: some View {
        HStack {
            Text("Converter")
                .foregroundStyle(.blackText)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding(.top)
    }
    
    var baseView: some View{
        
        VStack {
            Spacer()
            ScrollView{
                VStack{
                    Text("asdad")
                }
                
            }
            
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7)
            .background(Color.red)
            
            .roundedCorner(50, corners: [.topLeft, .topRight])
            
        }
        
    }
}

#Preview {
    ConverterView()
}
