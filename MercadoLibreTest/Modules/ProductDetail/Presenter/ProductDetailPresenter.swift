//
//  ProductDetailPresenter.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 15/05/21.
//

import Foundation

class ProductDetailPresenter: ProductDetailPresenterInputProtocol {
    
    var view: ProductDetailPresenterOutputProtocol?
    var router: ProductDetailRouterProtocol?
    
    func getState(product: ProductModel) -> String {
        return String(format: "state".localizedString(),
                      product.condition.localizedString(),
                      "\(product.soldQuantity)")
    }
    
    func getInstallments(product: ProductModel) -> String {
        guard let installments = product.installments else {
            return ""
        }
        return  String(format: LocalizablesMercadoLibre.ProductDetail.installments ,
                       "\(installments.quantity ?? 0)",
                       "\(installments.amount?.getCurrency() ?? "0")")
    }
    
    func getStockMessage(product: ProductModel) -> String {
        return  String(format: LocalizablesMercadoLibre.ProductDetail.unitStock ,
                       "\(product.availableQuantity)")
    }
    
    func getUbication(product: ProductModel) -> String {
        return String(format: LocalizablesMercadoLibre.ProductDetail.ubicationValue,
                      product.address.city,
                      product.address.state)
    }
}
