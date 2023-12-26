//
//  DataProvider.swift
//  moviesapp
//
//  Created by Turgay Afsar on 26.12.2023.
//

import Foundation
import Alamofire

final class DataProvider: DataProviderProtocol {

    public var baseURLString: String {
        NetworkConfiguration.apiBaseURLString
    }

    func send<T: APIRequest>(request: T, result: @escaping DataProviderResponse<T.Response>) {
        var requestURL: URL!
        do {
            requestURL = try (baseURLString + request.path).asURL()
        } catch {
            result(.failure(Error.invalidURL))
        }

        let request = AF.request(
            requestURL,
            method: request.httpMethod.method,
            parameters: request.data?.encodeToDictionary(using: .convertToSnakeCase),
            encoding: request.encoding,
            interceptor: request.interceptor.value)
            .validate(statusCode: 200..<300)

        request.response { response in
            switch response.result {
            case .success(let response):
                self.handleSuccess(response: response, result: result)
            case .failure(let error):
                if let data = response.data, let response = response.response, let httpStatus = response.httpStatus {
                    result(.failure(NetworkError.httpError(status: httpStatus, data: data)))
                } else {
                    result(.failure(NetworkError.unknown(error: error as NSError)))
                }
            }
        }
    }

    private func handleSuccess<T: Decodable>(response: Data?, result: @escaping DataProviderResponse<T>) {
        guard let response else { return result(.failure(NetworkError.mappingFailed)) }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let response = try decoder.decode(T.self, from: response)
            result(.success(response))
        } catch {
            result(.failure(NetworkError.mappingFailed))
        }

    }
}

extension DataProvider {
    public enum Error: Swift.Error {
        case invalidURL
        case httpError(status: Int, data: Data?)
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
}
