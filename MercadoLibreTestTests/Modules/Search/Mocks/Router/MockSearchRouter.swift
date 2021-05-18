//
//  MockSearchRouter.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import Foundation

struct SearchRouterCalls {
    var didPushToProductDetail: Bool = false
    var didCreateModule: Bool = false
}
@testable import MercadoLibreTest
class MockSearchRouter: SearchRouterProtocol {
    
    lazy var calls: SearchRouterCalls = SearchRouterCalls()
    func pushToProductDetail(from view: SearchViewInputProtocol, product: ProductModel) {
        calls.didPushToProductDetail = true
    }
    
    static func createModule() -> SearchViewController {
        
        return SearchViewController()
    }
}
