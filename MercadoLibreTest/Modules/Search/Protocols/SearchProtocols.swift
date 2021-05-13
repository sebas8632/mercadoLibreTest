//
//  SearchProtocols.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import Foundation

protocol SearchViewInputProtocol: class {
    
    // MARK: VARIABLES
    
    var presenter: SearchPresenterInputProtocol? { get set }
    
    // MARK: FUNCTIONS
    
    /// Function to configurate the view.
    func setupView()
    
    /// This function search the items indicate on the search component.
    func searchItems()
    
    /// This function select the specific item to get the detail.
    func selectItem()
    
    /// Function to show the loader.
    func presentLoader()
    
    /// Function to hide the loader.
    func hideLoader()
    
}

protocol SearchPresenterInputProtocol: class {
    
    // MARK: VARIABLES
    
    var view: SearchPresenterOutputProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var router: SearchRouterProtocol? { get set }
    
    // MARK: FUNCTIONS
    
    /// This function is used when the view has been loaded.
    func viewDidLoad()
    
    /// This functions is used when the view will appear.
    func viewWillAppear()
}

protocol SearchPresenterOutputProtocol {
    // TODO
}

protocol SearchInteractorInputProtocol: class {
    
    // MARK: VARIABLES
    
    var localDataManager: SearchLocalDataManagerProtocol? { get set }
    var remoteDataManager: SearchRemoteDataManagerProtocol? { get set }
}

protocol SearchInteractorOutputProtocol {
    // TODO

}

protocol SearchLocalDataManagerProtocol: class {
    // TODO

}

protocol SearchRemoteDataManagerProtocol: class {
    // TODO

}

protocol SearchRouterProtocol: class {
    
    /// Function to create the search module.
    /// - Returns: A UIViewController which represent the search module.
    static func createModule() -> SearchViewController
    
    func pushToItemDetail() -> Any
}
