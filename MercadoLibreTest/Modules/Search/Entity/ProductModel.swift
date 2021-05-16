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
    var price: Double
    var currency: String
    var address: AddressModel
    var attributes: [AttributeModel]
    var condition: String
    var thumbnail: String
    var soldQuantity: Int
    var availableQuantity: Int
    var installments: Installments?
    
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
        case soldQuantity = "sold_quantity"
        case availableQuantity = "available_quantity"
        case installments
    }
    
    func getState() -> String {
        switch condition {
        case "new":
            return "new".localizedString()
        default:
            return "used".localizedString()
        }
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

struct Installments: Codable {
    var quantity: Int?
    var amount: Double?
    
    enum CodingKeys: String, CodingKey {
        case quantity
        case amount
    }
}
