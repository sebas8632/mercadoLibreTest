//
//  MockSearchPresenter.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import Foundation

struct SearchPresenterCalls {
    var didRetrieveProducts: Bool = false
}

@testable import MercadoLibreTest
class MockSearchPresenter: SearchPresenterInputProtocol {
    var view: SearchPresenterOutputProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?
    lazy var calls: SearchPresenterCalls = SearchPresenterCalls()
    lazy var arrayProducts: [ProductModel] = []
    
    func viewDidLoad() {
        // TODo
    }

    func viewWillAppear() {
        // TODO
    }
 
}

extension MockSearchPresenter: SearchInteractorOutputProtocol {
    func didRetrieveProducts(products: [ProductModel]) {
        calls.didRetrieveProducts = true
        arrayProducts = products
    }
  
}
