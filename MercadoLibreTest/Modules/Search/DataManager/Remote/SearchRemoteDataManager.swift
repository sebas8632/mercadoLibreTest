//
//  RemoteDataManager.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import Foundation
import JSFSNetwork

class SearchRemoteDataManager: SearchRemoteDataManagerInputProtocol {
    var interactor: SearchRemoteDataManagerOutputProtocol?
    
    var sessionProvider: ProviderProtocol?

    func searchProducts(name: String) {
        sessionProvider?.request(type: ResultModel.self, service: SearchService.search(query: name), completion: { [weak self] (result) in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self?.interactor?.didRetrieveProducts(products: result.results)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.interactor?.didRetrievedError(error: error)
                }
            }
        })
        
    }
    
}
