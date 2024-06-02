//
//  ProfileView.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 2.06.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.brown
                Text("ProfileView")
                    .font(.largeTitle)
                    .padding()
            }
            .ignoresSafeArea()
        }
        .navigationTitle("Profile")
    }}

#Preview {
    ProfileView()
}
