//
//  NetworkError.swift
 
//
//  Created by Juan Florez on 12/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

public enum NetworkError: String, Error {
    
    case internalError = "Has ocurred an internal error"
    case serverError = "Has ocurred a server error"
    case parsingError = "Has ocurred a parsing error"
    case unknown = "Has ocurred an unknown error"
    case noJSONData = "Has ocurred an error"
    case noResponse = "It is not response"
}
