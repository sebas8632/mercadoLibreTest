//
//  SearchProtocols.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import Foundation
import JSFSNetwork

protocol SearchViewInputProtocol: class {
    
    // MARK: VARIABLES
    
    var presenter: SearchPresenterInputProtocol? { get set }
    
    // MARK: FUNCTIONS
    
    ///
    /// Function to configurate the view.
    ///
    func setupView()
    
    ///
    /// This function search the items indicate on the search component.
    ///
    func searchItems()
    
    ///
    /// This function select the specific item to get the detail.
    ///
    func selectItem()
    
    ///
    /// Function to show the loader.
    ///
    func presentLoader()
    
    ///
    /// Function to hide the loader.
    ///
    func hideLoader()
    
}

protocol SearchPresenterInputProtocol: class {
    
    // MARK: VARIABLES
    
    var view: SearchPresenterOutputProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var router: SearchRouterProtocol? { get set }
    
    // MARK: FUNCTIONS
    
    ///
    /// This function is used when the view has been loaded.
    ///
    func viewDidLoad()
    
    ///
    /// This functions is used when the view will appear.
    ///
    func viewWillAppear()
}

protocol SearchPresenterOutputProtocol {
    // TODO
}

protocol SearchInteractorInputProtocol: class {
    
    // MARK: VARIABLES
    var presenter: SearchInteractorOutputProtocol? { get set }
    var localDataManager: SearchLocalDataManagerProtocol? { get set }
    var remoteDataManager: SearchRemoteDataManagerInputProtocol? { get set }
    
    // MARK: FUNCTIONS
    
    /// Function to search products on mercado libre.
    /// - Parameter name: name of the product to search.
    ///
    func searchProducts(name: String)
}

protocol SearchInteractorOutputProtocol {
    ///
    ///  Function to response when the app has retrieved the products.
    ///  - Parameter products: List of products as result of the searching.
    ///
    func didRetrieveProducts(products: [ProductModel])
    
}

protocol SearchLocalDataManagerProtocol: class {
    // TODO
    
}

protocol SearchRemoteDataManagerInputProtocol: class {
    
    // MARK: VARIABLES
    var interactor: SearchRemoteDataManagerOutputProtocol? { get set }
    var sessionProvider: ProviderProtocol? { get set }
    
    // MARK: Functions
    
    ///
    /// Function to search products directly in the remote provider.
    /// - Parameter name: Name of the product which is searching for.
    ///
    func searchProducts(name: String)
    
}

protocol SearchRemoteDataManagerOutputProtocol {
    
    // MARK: FUNCTIONS
    
    func didRetrieveProducts(products: [ProductModel])
}

protocol SearchRouterProtocol: class {
    
    /// Function to create the search module.
    /// - Returns: A UIViewController which represent the search module.
    ///
    static func createModule() -> SearchViewController
    
    ///
    /// Function to push the app to the next View.
    ///
    func pushToItemDetail() -> Any
}
