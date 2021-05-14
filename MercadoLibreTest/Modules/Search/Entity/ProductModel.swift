//
//  ProductModel.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import Foundation

struct ProductModel: Codable {
    
    var identifier: String
    var siteId: String
    var name: String
    var price: Int
    var currency: String
    var address: AddressModel
    var attributes: [AttributeModel]
    var condition: String
    var thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case siteId = "site_id"
        case name = "title"
        case price
        case currency = "currency_id"
        case address
        case attributes
        case condition
        case thumbnail
    }
}

struct AddressModel: Codable {
    var state: String
    var city: String
    
    enum CodingKeys: String, CodingKey {
        case state = "state_name"
        case city = "city_name"
    }
}

struct AttributeModel: Codable {
    var name: String
    var value: String?
    var groupId: String
    var groupName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case value = "value_name"
        case groupId = "attribute_group_id"
        case groupName = "attribute_group_name"
    }
}
