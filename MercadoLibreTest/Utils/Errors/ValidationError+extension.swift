//
//  ValidationError+extension.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 17/05/21.
//

import Foundation

extension ValidationError {
    func getMessage() -> String {
        switch self {
        case .empty:
            return LocalizablesMercadoLibre.ValidationError.isEmptyError
        case .tooShort:
            return LocalizablesMercadoLibre.ValidationError.tooShortError
        }
    }
}
