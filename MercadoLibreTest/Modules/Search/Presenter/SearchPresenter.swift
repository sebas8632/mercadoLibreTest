//
//  SearchPresenter.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import Foundation

class SearchPresenter: SearchPresenterInputProtocol {
    
    var view: SearchPresenterOutputProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?
    
    func viewDidLoad() {
        // TODO
    }
    
    func viewWillAppear() {
        // TODO
    }
    
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    func didRetrieveProducts(products: [ProductModel]) {
        // TODO
    }
    
}
