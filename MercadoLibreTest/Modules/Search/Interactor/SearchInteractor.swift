//
//  SearchInteractor.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import Foundation
import JSFSNetwork

class SearchInteractor: SearchInteractorInputProtocol {
    var presenter: SearchInteractorOutputProtocol?
    var localDataManager: SearchLocalDataManagerProtocol?
    var remoteDataManager: SearchRemoteDataManagerInputProtocol?
    
    func searchProducts(name: String) {
        remoteDataManager?.searchProducts(name: name)
    }
}

extension SearchInteractor: SearchRemoteDataManagerOutputProtocol {
    
    func didRetrieveProducts(products: [ProductModel]) {
        presenter?.didRetrieveProducts(products: products)
    }
    
    func didRetrievedError(error: NetworkError) {
        presenter?.didRetrievedError(error: error.rawValue)
    }
}
