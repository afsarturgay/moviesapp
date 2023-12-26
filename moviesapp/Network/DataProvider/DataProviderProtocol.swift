//
//  DataProviderProtocol.swift
//  moviesapp
//
//  Created by Turgay Afsar on 26.12.2023.
//

import Foundation

typealias DataProviderResponse<T: Decodable> = (Result<T, Error>) -> Void

protocol DataProviderProtocol {
    var baseURLString: String { get }

    func send<T: APIRequest>(request: T,
                             result: @escaping DataProviderResponse<T.Response>)
}
