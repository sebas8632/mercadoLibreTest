//
//  SearchRouter.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import Foundation

class SearchRouter: SearchRouterProtocol {
    
    static func createModule() -> SearchViewController {
        
        let view: SearchViewController = SearchViewController()
        let presenter: SearchPresenterInputProtocol & SearchInteractorOutputProtocol = SearchPresenter()
        let interactor: SearchInteractorInputProtocol = SearchInteractor()
        let localDataManager: SearchLocalDataManagerProtocol = SearchLocalDataManager()
        let remoteDataManager: SearchRemoteDataManagerInputProtocol = SearchRemoteDataManager()
        let router: SearchRouterProtocol = SearchRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.localDataManager = localDataManager
        interactor.remoteDataManager = remoteDataManager
        
        return view
    }
    
    func pushToItemDetail() -> Any {
        // TODO
        return false
    }
    
}
