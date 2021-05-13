//
//  MockSearchInteractor.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import Foundation

struct SearchInteractorCalls {
    var didRetrieveProductsCall: Bool = false
}

@testable import MercadoLibreTest
class MockSearchInteractor: SearchInteractorInputProtocol & SearchRemoteDataManagerOutputProtocol {
    var presenter: SearchInteractorOutputProtocol?
    var localDataManager: SearchLocalDataManagerProtocol?
    var remoteDataManager: SearchRemoteDataManagerInputProtocol?
    lazy var calls: SearchInteractorCalls = SearchInteractorCalls()
    
    func searchProducts(name: String) {
        remoteDataManager?.searchProducts(name: name)
    }
    
    func didRetrieveProducts(products: [ProductModel]) {
        calls.didRetrieveProductsCall = true
        presenter?.didRetrieveProducts(products: products)
    }
}
