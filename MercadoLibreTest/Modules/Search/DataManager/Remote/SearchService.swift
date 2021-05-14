//
//  SearchService.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import Foundation
import JSFSNetwork

enum SearchService: ServiceProtocol {
    
    case search(query: String)
    
    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    var path: String {
        return "/search"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var task: Task {
        switch self {
        case let .search(query):
            let parameters = ["q": query]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers {
        let headers: [String: String] = [ : ]
        return headers
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
}
