//
//  ProductDetailRouter.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 15/05/21.
//

import Foundation
import UIKit
class ProductDetailRouter: ProductDetailRouterProtocol {
    static func createModule(product: ProductModel) -> ProductDetailViewController {
        let view: ProductDetailViewController = ProductDetailViewController()
        let presenter: ProductDetailPresenterInputProtocol = ProductDetailPresenter()
        let router: ProductDetailRouterProtocol = ProductDetailRouter()
        
        view.product = product
        view.presenter = presenter
        presenter.view = view
        presenter.router = router

        return view
    }
    
}
