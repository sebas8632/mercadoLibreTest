//
//  SearchInteractor.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
   
    var localDataManager: SearchLocalDataManagerProtocol?
    
    var remoteDataManager: SearchRemoteDataManagerProtocol?
    
}
