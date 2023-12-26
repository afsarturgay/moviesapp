//
//  Interceptor.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import Alamofire

enum Interceptor {
    case apiKeyInterceptor

    var value: Alamofire.RequestInterceptor {
        switch self {
        case .apiKeyInterceptor:
            APIKeyInterceptor()
        }
    }
}
