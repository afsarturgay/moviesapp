//
//  APIKeyInterceptor.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import Foundation
import Alamofire

final class APIKeyInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, 
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.addValue(NetworkConfiguration.token, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        completion(.success(urlRequest))
    }
}
