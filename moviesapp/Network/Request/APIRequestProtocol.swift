//
//  APIRequestProtocol.swift
//  moviesapp
//
//  Created by Turgay Afsar on 26.12.2023.
//

import Alamofire
import Foundation

protocol APIRequest {
    associatedtype Response: Decodable

    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var data: Codable? { get }
    var encoding: URLEncoding { get }
    var interceptor: Interceptor { get }
}

extension APIRequest {
    var encoding: URLEncoding {
        .default
    }

    var data: Codable? {
        nil
    }

    var interceptor: Interceptor {
        .apiKeyInterceptor
    }
}
