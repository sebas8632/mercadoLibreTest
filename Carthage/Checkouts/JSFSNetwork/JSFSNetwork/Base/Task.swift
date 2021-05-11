//
//  Task.swift
 
//
//  Created by Juan Florez on 12/09/20.
//  Copyright © 2020 Juan Florez. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public enum Task {
    case requestPlain
    case requestParameters(Parameters)
}
