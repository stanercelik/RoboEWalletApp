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
            VStack {
                RobotView()
                
                Text("Register")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .font(.largeTitle)
                
                VStack(spacing: 12) {
                    customTextField(text: $viewModel.username, placeholder: "Username", iconName: "person", softColor: Color.softOrange, color: Color.appOrange)
                    customTextField(text: $viewModel.email, placeholder: "Email", iconName: "envelope", softColor: Color.softMint, color: Color.appMint)
                    customTextField(text: $viewModel.password, placeholder: "Password", iconName: "lock", softColor: Color.softPurple, color: Color.appPurple)
                }
                
                NavigationLink(destination: Tabs().navigationBarBackButtonHidden(true), isActive: $viewModel.isRegistered) {
                    EmptyView()
                }
                
                CustomButton(action: viewModel.registerButtonPressed, text: "Register", width: 325, height: 55, backgroundColor: .buttonColor, textColor: .white)
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
            .background(Color.backgroundColor)
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
        .background(Capsule().fill(Color.white))
        .shadow(color: Color.gray.opacity(0.1), radius: 5)
    }
}

struct RobotView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image("robot_background_light")
            Image("robot_background")
                .padding(.top, 40)
            Image("robot")
        }
    }
}

struct SocialButton: View {
    let logo: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                Circle().fill(Color.white)
                Image(logo)
                    .padding(20)
            }
            .shadow(color: Color.gray.opacity(0.12), radius: 10, x: 2, y: 2)
        })
    }
}
