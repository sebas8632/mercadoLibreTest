//
//  MockSearchPresenter.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import Foundation

struct SearchPresenterCalls {
    var didRetrieveProducts: Bool = false
    var searchProducts: Bool = false
    var didRetrieveError: Bool = false
    var didGoToProductDetail: Bool = false
}

@testable import MercadoLibreTest
class MockSearchPresenter: SearchPresenterInputProtocol {

    var view: SearchPresenterOutputProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?
    lazy var calls: SearchPresenterCalls = SearchPresenterCalls()
    lazy var arrayProducts: [ProductModel] = []
    lazy var errorMessage: String = ""
    
    func searchProducts(name: String) {
        calls.searchProducts = true
        interactor?.searchProducts(name: name)
    }
 
    func goToProductDetail(from: SearchViewInputProtocol, product: ProductModel) {
        calls.didGoToProductDetail = true
    }
}

extension MockSearchPresenter: SearchInteractorOutputProtocol {
    
    func didRetrieveProducts(products: [ProductModel]) {
        calls.didRetrieveProducts = true
        arrayProducts = products
        view?.didRetrieveProducts(products: products)
    }
    
    func didRetrievedError(error: String) {
        calls.didRetrieveError = true
        errorMessage = error
    }
  
}
