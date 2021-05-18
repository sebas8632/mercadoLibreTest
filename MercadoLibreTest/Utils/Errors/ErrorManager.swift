//
//  ErrorManager.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 17/05/21.
//

import Foundation
import JSFSNetwork
import JSFSPopUps
import UIKit

class ErrorManager {
    
    static func manageError(error: Error, from view: UIViewController) {
        var message: String = "Error inesperado"
        if error is ValidationError {
            let validationError = error as! ValidationError
            message = validationError.getMessage()
        }
        if error is NetworkError {
            let networkError = error as! NetworkError
            message = networkError.getMessage()
            
        }

        PopUpManager.showError(error: message, from: view)
        
    }
}
