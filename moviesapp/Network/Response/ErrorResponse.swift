//
//  ErrorResponse.swift
//  moviesapp
//
//  Created by Turgay Afsar on 26.12.2023.
//

import Foundation

struct ErrorResponse: Decodable {
    var code: Int?
    var message: String?
    var isSuccess: Bool?

    enum CodingKeys: String, CodingKey {
        case code = "status_code"
        case message = "status_message"
        case isSuccess = "success"
    }
}
