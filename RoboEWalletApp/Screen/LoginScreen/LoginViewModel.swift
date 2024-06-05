//
//  LoginViewModel.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 28.05.2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isRegistered: Bool = false
    
    func registerButtonPressed() {
        print("Register Button Pressed")
        
        isRegistered = true
    }
    
    func socialLogin(provider: String) {
        print("\(provider) Login")
        
    }
}
