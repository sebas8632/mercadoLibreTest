//
//  String+extension.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 15/05/21.
//

import Foundation

extension String {
    func localizedString() -> String {
        var result = Bundle.main.localizedString(forKey: self, value: nil, table: nil)

        if result == self {
            result = Bundle.main.localizedString(forKey: self, value: nil, table: "Localizables")
        }

        return result
    }
}
