//
//  MockSearchRouter.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import Foundation

struct SearchRouterCalls {
    var didPushToItemDetail: Bool = false
}
@testable import MercadoLibreTest
class MockSearchRouter: SearchRouterProtocol {
    
    static func createModule() -> SearchViewController {
        // TODO
        return SearchViewController()
    }
    
    func pushToItemDetail() -> Any {
        // TODO
        return 0
    }
    
}
