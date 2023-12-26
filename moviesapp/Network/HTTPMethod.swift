//
//  HTTPMethod.swift
//  moviesapp
//
//  Created by Turgay Afsar on 26.12.2023.
//

import Alamofire

enum HTTPMethod {
    case get
    case post
    case put
    case delete

    var method: Alamofire.HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        }
    }
}
