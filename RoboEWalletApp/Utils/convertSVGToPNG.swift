//
//  convertSVGToPNG.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 26.06.2024.
//


import SVGKit
import UIKit

func convertSVGToPNG(svgURL: URL, completion: @escaping (UIImage?) -> Void) {
    DispatchQueue.global(qos: .background).async {
        guard let svgImage = SVGKImage(contentsOf: svgURL) else {
            completion(nil)
            return
        }

        let uiImage = svgImage.uiImage
        completion(uiImage)
    }
}

