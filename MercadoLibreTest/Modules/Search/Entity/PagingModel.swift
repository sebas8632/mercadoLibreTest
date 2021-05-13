//
//  PagingModel.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import Foundation

struct PagingModel: Codable {
    
    var total: Int
    var primaryResults: Int
    var offset: Int
    var limit: Int
    
    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset
        case limit
    }
}
