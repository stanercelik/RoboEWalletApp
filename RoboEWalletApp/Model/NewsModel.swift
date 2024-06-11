//
//  News.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 6.06.2024.
//

import Foundation

struct NewsModel : Identifiable {
    var id = UUID()
    var isFullWidthNews: Bool
    var image: String
    var text: String
    var date: String
}
