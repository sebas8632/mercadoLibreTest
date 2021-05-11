//
//  URLSessionProvider.swift
 
//
//  Created by Juan Florez on 12/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

public class URLSessionProvider: ProviderProtocol {
    
    private var session: URLSessionProtocol
    
    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    public func request<T>(type: T.Type,
                           service: ServiceProtocol,
                           completion: @escaping (NetworkResponse<T>) -> Void) where T: Decodable {
        
        let request = URLRequest(service: service)
        let task = session.dataTask(request: request, completionHandler: {[weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            guard let strongSelf = self else {
                completion(.failure(.internalError)); return
            }
            strongSelf.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        task.resume()
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (NetworkResponse<T>) -> Void) {
        guard error == nil else { return completion(.failure(.serverError)) }
        guard let response = response else { return completion(.failure(.noResponse)) }
        
        switch response.statusCode {
        case 200...299:
            guard let data = data else { return completion(.failure(.unknown)) }
            guard let model = try? JSONDecoder().decode(T.self, from: data) else { completion(.failure(.parsingError))
                return}
            completion(.success(model))
        default:
            completion(.failure(.serverError))
        }
    }
}
