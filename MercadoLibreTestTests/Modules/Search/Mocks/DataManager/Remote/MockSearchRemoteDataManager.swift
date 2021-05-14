//
//  MockSearchRemoteDataManager.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import Foundation
import JSFSNetwork

struct SearchRemoteDataManagerCalls {
    var searchProducts: Bool = false
}

@testable import MercadoLibreTest
class MockSearchRemoteDataManager: SearchRemoteDataManagerInputProtocol {
    
    var interactor: SearchRemoteDataManagerOutputProtocol?
    var sessionProvider: ProviderProtocol?
    lazy var calls: SearchRemoteDataManagerCalls = SearchRemoteDataManagerCalls()
    
    func searchProducts(name: String) {
        calls.searchProducts = true
        if name == "Fail Product Name" {
            interactor?.didRetrievedError(error: NetworkError.noJSONData)
        } else {
            var products: [ProductModel] = []
            products.append(ProductModel(identifier: "hkjh",
                                         siteId: "MCO",
                                         name: "Volkswagen Golf TSI",
                                         price: 62000000,
                                         currency: "COP",
                                         address: AddressModel(state: "Cundinamarca",
                                                               city: "Chía"),
                                         attributes: [AttributeModel(name: "Aire Acondicionado",
                                                                     value: "SI",
                                                                     groupId: "comfort",
                                                                     groupName: "COMFORT")],
                                         condition: "Used",
                                         thumbnail: "https://http2.mlstatic.com/D_855969-MCO45404796897_032021-I.jpg"))
            
            products.append(ProductModel(identifier: "hkjjh",
                                         siteId: "MCO",
                                         name: "Volkswagen Golf TSI",
                                         price: 61900000,
                                         currency: "COP",
                                         address: AddressModel(state: "Quindío",
                                                               city: "Armenia"),
                                         attributes: [AttributeModel(name: "Aire Acondicionado",
                                                                     value: "SI",
                                                                     groupId: "comfort",
                                                                     groupName: "COMFORT")],
                                         condition: "Used",
                                         thumbnail: "https://http2.mlstatic.com/D_855969-MCO45404796897_032021-I.jpg"))
            
            interactor?.didRetrieveProducts(products: products)
        }
    }
    
}
