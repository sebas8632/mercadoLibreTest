//
//  Double+extension.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 14/05/21.
//

import Foundation

extension Double {
    
    func getCurrency() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .decimal
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current

        // We'll force unwrap with the !, if you've got defined data you may need more error checking

        let priceString = currencyFormatter.string(from: NSNumber(value: self))!
        let price = "$\(priceString)"
        return price
    }
    
}
