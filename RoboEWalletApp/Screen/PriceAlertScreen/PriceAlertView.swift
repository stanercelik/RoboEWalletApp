//
//  PriceAlertView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 11.06.2024.
//

import SwiftUI

struct PriceAlertView: View {
    
    @StateObject private var viewmodel = PriceAlertViewmodel()
    
    var body: some View {
        ZStack{
            backgroundView
            VStack{
                    HeaderWithBackButton()
                    
                    alertTextView
                    
                
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
                Color.softRed.opacity(0.8),
                Color.customPurple.opacity(0.12),
                Color.customPurple.opacity(0.1),
                Color.appBackground]),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    var alertTextView: some View{
        HStack{
            Text("Price Alert")
                .foregroundStyle(.blackText)
                .font(.title)
                .fontWeight(.medium)
            Spacer()
        }
        .padding(.horizontal)
    }
    
    var baseView: some View{
        
        VStack {
            Spacer()
            ScrollView{
                VStack{
                    CryptoAlert(circleIcon: CircleIcon(cryptoCurrency: .bitcoin, frame: 45), cryptoName: "Bitcoin", shortCryptoName: "BTC", alertList: viewmodel.btcAlertList)
                    
                    CryptoAlert(circleIcon: CircleIcon(cryptoCurrency: .neo, frame: 45), cryptoName: "Neo", shortCryptoName: "NEO", alertList: viewmodel.neoAlertList)
                    
                    CryptoAlert(circleIcon: CircleIcon(cryptoCurrency: .vechain, frame: 45), cryptoName: "Vechain", shortCryptoName: "VCH", alertList: viewmodel.vechainAlertList)
                    
                    Spacer()
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.8)
            .background(Color.appBackground.opacity(0.5))
            
            .roundedCorner(50, corners: [.topLeft, .topRight])
            
        }
        
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    PriceAlertView()
}

struct HeaderWithBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        HStack{
            CircleIcon(softColor: .customWhite, color: .blackText, iconName: "arrow.left", frame: 50, isSystemIcon: true, imageFrame: 50)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer()
        }
    }
}

struct CryptoAlert: View{
    var circleIcon: CircleIcon
    var cryptoName: String
    var shortCryptoName: String
    var alertList : [AlertModel]
    
    var body: some View{
        VStack(spacing: 24){
            HStack{
                circleIcon
                Text(cryptoName)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.blackText)
                Text(shortCryptoName)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.blackText)
                Spacer()
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .fontWeight(.semibold)
                    .foregroundStyle(.customBlue)
            }
            .padding(.trailing)
            VStack{
                ForEach(alertList.indices, id: \.self) { index in
                    if index != 0 {
                        Divider()
                    }
                    AlertView(alertModel: alertList[index])
                        
                }
            }
            .padding(.vertical)
            .background(Color.customWhite)
            .cornerRadius(20)
            
        }
        
        .padding(.horizontal)
        .padding(.vertical, 32)
    }
}


struct AlertView: View{
    @ObservedObject var alertModel: AlertModel
    
    var body: some View {
        if alertModel.isAbove {
            AlertRowView(alertModel: alertModel, circleIcon: CircleIcon(softColor: .softMint, color: .customMint, iconName: "arrow.up.right", isSystemIcon: true, imageFrame: 30, iconWeight: .semibold), isAboveString: "Above")
        }
        else {
            AlertRowView(alertModel: alertModel, circleIcon: CircleIcon(softColor: .softRed, color: .customRed, iconName: "arrow.down.left", isSystemIcon: true, imageFrame: 30, iconWeight: .semibold), isAboveString: "Below")
            
            
        }
        
    }
}


struct AlertRowView: View {
    @ObservedObject var alertModel: AlertModel
    let circleIcon: CircleIcon
    let isAboveString: String
    
    var body: some View {
        HStack {
            circleIcon
            VStack(alignment: .leading) {
                Text("\(isAboveString) $ \(alertModel.amount)")
                    .fontWeight(.medium)
                    .foregroundStyle(.blackText)
                    .lineLimit(1)
                Text(alertModel.time)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.customLightGray)
            }
            Spacer()
            Toggle("", isOn: $alertModel.isActive)
                .tint(.customPurple)
                .scaleEffect(x: 0.85, y: 0.8)
        }
        .padding(.horizontal)
    }
}
