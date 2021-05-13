//
//  MockSearchRemoteDataManager.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import Foundation
import JSFSNetwork

struct SearchRemoteDataManagerCalls {
    var didRetrieveProducts: Bool = false
}

@testable import MercadoLibreTest
class MockSearchRemoteDataManager: SearchRemoteDataManagerInputProtocol {
   
    var interactor: SearchRemoteDataManagerOutputProtocol?
    var sessionProvider: ProviderProtocol?
    lazy var calls: SearchRemoteDataManagerCalls = SearchRemoteDataManagerCalls()

    func searchProducts(name: String) {
        calls.didRetrieveProducts = true
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
                                     condition: "Used"))
        
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
                                     condition: "Used"))
        
        interactor?.didRetrieveProducts(products: products)
    }
    
}
