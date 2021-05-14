//
//  SearchResult.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import Foundation

struct ResultModel: Codable {
    var paging: PagingModel
    var results: [ProductModel]
    
    enum CodingKeys: String, CodingKey {
        case paging
        case results
    }
}
