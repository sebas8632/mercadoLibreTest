//
//  ImageView+extension.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 14/05/21.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImageFrom(url: String) {
        let replaced = url.replacingOccurrences(of: "http://", with: "https:")
        let url = URL(string: replaced)
        let scale = UIScreen.main.scale
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            options: [
                .scaleFactor(scale),
                .transition(.fade(1))
            ])
    }
}
