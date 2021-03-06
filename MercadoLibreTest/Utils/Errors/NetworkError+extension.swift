//
//  NetworkError+extension.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 17/05/21.
//

import Foundation
import JSFSNetwork

extension NetworkError {
    
    func getMessage() -> String {
        switch self {
        case .serverError:
            return LocalizablesMercadoLibre.NetworkError.serverError
        default:
            return LocalizablesMercadoLibre.NetworkError.unknownError
        }
    }
}
