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
    ///  - Parameter item: Name of the item that is searching for.
    ///
    func searchItems(item: String)
    
    ///
    /// This function select the specific item to get the detail.
    ///
    func selectItem()
    
    ///
    /// Function to show the loader.
    ///
    func presentLoader()
    
    ///
    /// Function to show an specific error.
    /// - Parameter error:
    ///
    func showError(error: String)
    
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
    
    ///
    /// Function to search products.
    /// - Parameter name: Name of the product.
    ///
    func searchProducts(name: String)
}

protocol SearchPresenterOutputProtocol {
    
    ///
    ///  Function to response when the app has retrieved the products.
    ///  - Parameter products: List of products as result of the searching.
    ///
    func didRetrieveProducts(products: [ProductModel])
    
    ///
    /// Function to retrieve the error.
    /// - Parameters error: error from presenter.
    ///
    func didRetrievedError(error: String)
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
    
    ///
    /// Function to retrieve the error.
    /// - Parameters error: error from interactor.
    ///
    func didRetrievedError(error: String)
    
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
    
    ///
    /// Function to retrieve products to Interactor..
    /// - Parameter products: products retrieved from mercado libre service.
    ///
    func didRetrieveProducts(products: [ProductModel])
    
    ///
    /// Function to retrieve the error.
    /// - Parameters error: error from session provider.
    ///
    func didRetrievedError(error: NetworkError)
    
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
