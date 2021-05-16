//
//  ProductDetailProtocols.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 15/05/21.
//

import Foundation
import UIKit

protocol ProductDetailViewProtocol: class {
    
    // MARK: VARIABLES
    var presenter: ProductDetailPresenterInputProtocol? { get set }
    var product: ProductModel? { get set }
    
    // MARK: FUNCTIONS
    
    ///
    /// Function to setup the view with the product values.
    ///
    func setupView()
    
    ///
    /// Function to show skeleton while the data is charging.
    ///
    func showSkeleton()
    
}

protocol ProductDetailPresenterInputProtocol: class {
   
    // MARK: VARIABLES
    var view: ProductDetailViewController? { get set }
    var router: ProductDetailRouterProtocol? { get set }
    
    // MARK: FUNCTIONS
    
    ///
    /// Function to concatenate the product state.
    /// - Parameters product. Object with the information to concatenate the state.
    ///
    func getState(product: ProductModel) -> String
    
    ///
    /// Function to concatenate the product installments.
    /// - Parameters product. Object with the information to concatenate the installments info.
    ///
    func getInstallments(product: ProductModel) -> String
    
    ///
    /// Function to concatenate the product stock message.
    /// - Parameters product. Object with the information to concatenate the stock message.
    ///
    func getStockMessage(product: ProductModel) -> String
    
    ///
    /// Function to concatenate the product ubication.
    /// - Parameters product. Object with the information to concatenate theproduct ubication
    ///
    func getUbication(product: ProductModel) -> String
        
}

protocol ProductDetailRouterProtocol {
    
    /// Function to create the product detail module.
    /// - Returns: A UIViewController which represent the search module.
    ///
    static func createModule(product: ProductModel) -> ProductDetailViewController

}
