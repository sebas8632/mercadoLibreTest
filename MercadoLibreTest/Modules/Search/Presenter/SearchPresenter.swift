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
    
    func searchProducts(name: String) {
        guard name.count > 2 else {
            view?.didRetrievedError(error: ValidationError.tooShort)
            return
        }
        interactor?.searchProducts(name: name)
    }
    
    func goToProductDetail(from: SearchViewInputProtocol, product: ProductModel) {
        router?.pushToProductDetail(from: from, product: product)
    }
    
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    
    func didRetrieveProducts(products: [ProductModel]) {
        view?.didRetrieveProducts(products: products)
    }
    
    func didRetrievedError(error: Error) {
        view?.didRetrievedError(error: error)
    }
}
