//
//  PopularTVRequest.swift
//  moviesapp
//
//  Created by Turgay Afsar on 26.12.2023.
//

import Foundation

struct PopularTVRequest: APIRequest {
    typealias Response = PopularTVResponse

    var httpMethod: HTTPMethod = .get
    var path: String = "/3/tv/popular"
}
