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
        // TODO 
    }
    
}
