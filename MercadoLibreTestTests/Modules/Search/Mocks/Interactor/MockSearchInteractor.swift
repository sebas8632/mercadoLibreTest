//
//  MockSearchInteractor.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import Foundation
import JSFSNetwork
struct SearchInteractorCalls {
    var searchProductsCall: Bool = false
    var didRetrieveProductsCall: Bool = false
    var didRetrieveErrorCall: Bool = false
}

@testable import MercadoLibreTest
class MockSearchInteractor: SearchInteractorInputProtocol & SearchRemoteDataManagerOutputProtocol {
    
    var presenter: SearchInteractorOutputProtocol?
    var localDataManager: SearchLocalDataManagerProtocol?
    var remoteDataManager: SearchRemoteDataManagerInputProtocol?
    lazy var calls: SearchInteractorCalls = SearchInteractorCalls()
    
    func searchProducts(name: String) {
        calls.searchProductsCall = true
        remoteDataManager?.searchProducts(name: name)
    }
    
    func didRetrieveProducts(products: [ProductModel]) {
        calls.didRetrieveProductsCall = true
        presenter?.didRetrieveProducts(products: products)
    }
    
    func didRetrievedError(error: NetworkError) {
        calls.didRetrieveErrorCall = true
        presenter?.didRetrievedError(error: error.rawValue)
    }
}
