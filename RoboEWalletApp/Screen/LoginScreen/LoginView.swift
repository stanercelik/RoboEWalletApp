//
//  LoginView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 28.05.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack { //10dan fazlaysa Group
                RobotView()
                
                Text("Register")
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.blackText)
                    .font(.largeTitle)
                
                VStack(spacing: 12) {
                    customTextField(text: $viewModel.username, placeholder: "Username", iconName: "person", softColor: Color.softOrange, color: Color.customOrange)
                    customTextField(text: $viewModel.email, placeholder: "Email", iconName: "envelope", softColor: Color.softMint, color: Color.customMint)
                    customTextField(text: $viewModel.password, placeholder: "Password", iconName: "lock", softColor: Color.softPurple, color: Color.customPurple)
                }
                
                NavigationLink(destination: Tabs().navigationBarBackButtonHidden(true), isActive: $viewModel.isRegistered) {
                    EmptyView()
                }
                
                CustomButton(action: viewModel.registerButtonPressed, text: "Register", width: 325, height: 55, backgroundColor: .loginButton, textColor: .whiteText)
                    .padding()
                
                HStack(spacing: 20) {
                    Spacer()
                    SocialButton(logo: "google_logo", action: { viewModel.socialLogin(provider: "Google") })
                    SocialButton(logo: "facebook_logo", action: { viewModel.socialLogin(provider: "Facebook") })
                    SocialButton(logo: "apple_logo", action: { viewModel.socialLogin(provider: "Apple") })
                    Spacer()
                }
                .padding()
            }
            .padding()
            .background(Color.appBackground)
        }
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct customTextField: View {
    let text: Binding<String>
    let placeholder: String
    let iconName: String
    let softColor: Color
    let color: Color
    
    var body: some View {
        HStack(alignment: .center) {
            
            CircleIcon(softColor: softColor, color: color, iconName: iconName, frame: 40, padding: 8, isSystemIcon: true)
            Spacer()
            TextField(placeholder, text: text)
        }
        .background(Capsule().fill(Color.customWhite))
        .shadow(color: Color.appSecondaryText.opacity(0.1), radius: 5)
    }
}

struct RobotView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                Image("robot_background_light")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                
                Image("robot_background")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                    .padding(.top, 40)
                
                Image("robot")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
            }
            .frame(width: geometry.size.width, height: geometry.size.height )
        }
    }
}

struct SocialButton: View {
    let logo: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                Circle().fill(Color.customWhite)
                Image(logo)
                    .padding(20)
            }
            .shadow(color: Color.gray.opacity(0.12), radius: 10, x: 2, y: 2)
        })
    }
}

// Components ,,
// Resources (Lottie animasyon, renk...) ,,,,
// Screen
// HomeScreen
// HomeView VM

// NetworkLayer
// Model ,,
// App ,,,
