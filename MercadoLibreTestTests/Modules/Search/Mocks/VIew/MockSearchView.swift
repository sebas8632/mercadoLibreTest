//
//  MockSearchView.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import Foundation

struct SearchViewCalls {
    var didRetrieveProductsCall: Bool = false
    var didRetrieveError: Bool = false
}

@testable import MercadoLibreTest
class MockSearchView: SearchPresenterOutputProtocol {
    
    var presenter: SearchPresenterInputProtocol?
    lazy var calls: SearchViewCalls = SearchViewCalls()
    var products: [ProductModel] = []
    
    lazy var errorMessage: String = ""
    
    func didRetrieveProducts(products: [ProductModel]) {
        calls.didRetrieveProductsCall = true
        self.products = products
        
    }
    
    func didRetrievedError(error: String) {
        calls.didRetrieveError = true
        errorMessage = error
    }
}
