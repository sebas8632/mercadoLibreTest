//
//  ProviderProtocol.swift
//
//  Created by Juan Florez on 12/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

public protocol ProviderProtocol {
    func request<T>(type: T.Type,
                    service: ServiceProtocol,
                    completion: @escaping (Result<T, NetworkError>)
                        -> Void) where T: Codable
}
