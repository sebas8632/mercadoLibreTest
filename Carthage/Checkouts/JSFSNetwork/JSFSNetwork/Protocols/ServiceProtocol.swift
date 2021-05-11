//
//  ServiceProtocol.swift
 
//
//  Created by Juan Florez on 12/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

public typealias Headers = [String: String]

public protocol ServiceProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: Headers { get }
    var parametersEncoding: ParametersEncoding { get }
}
