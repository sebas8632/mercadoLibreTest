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
    func selectItem(product: ProductModel)
    
    ///
    /// Function to show an specific error.
    /// - Parameter error:
    ///
    func showError(error: Error)
    
}

protocol SearchPresenterInputProtocol: class {
    
    // MARK: VARIABLES
    
    var view: SearchPresenterOutputProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var router: SearchRouterProtocol? { get set }
    
    // MARK: FUNCTIONS
    
    ///
    /// Function to search products.
    /// - Parameter name: Name of the product.
    ///
    func searchProducts(name: String)
    
    ///
    /// Function to go to the product detail module.
    /// - Parameters from. View from the navigacion comes.
    /// - Parameters product. Product model with data to show on product detail view.
    ///
    func goToProductDetail(from: SearchViewInputProtocol, product: ProductModel)
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
    func didRetrievedError(error: Error)
}

protocol SearchInteractorInputProtocol: class {
    
    // MARK: VARIABLES
    var presenter: SearchInteractorOutputProtocol? { get set }
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
    func didRetrievedError(error: Error)
    
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
    func didRetrievedError(error: Error)
    
}

protocol SearchRouterProtocol: class {
    
    /// Function to create the search module.
    /// - Returns: A UIViewController which represent the search module.
    ///
    static func createModule() -> SearchViewController
    
    ///
    /// Function to push the app to the next View.
    ///
    func pushToProductDetail(from view: SearchViewInputProtocol, product: ProductModel)
}
