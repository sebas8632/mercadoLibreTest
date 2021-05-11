//
//  URLRequest+Extension.swift
 
//
//  Created by Juan Florez on 12/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

extension URLRequest {
    
    init(service: ServiceProtocol) {
        let urlComponents = URLComponents(service: service)
        self.init(url: urlComponents.url!)
        httpMethod = service.method.rawValue
        if service.parametersEncoding == .json {
            
            addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        service.headers.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
        
        guard case let .requestParameters(parameters) = service.task, service.parametersEncoding == .json else { return }
        guard let data = try? JSONSerialization.data(withJSONObject: parameters) else { print("ERROR NETWORKING"); return}
        httpBody = data
    }
}
