//
//  TVDetailRequest.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import Foundation

struct TVDetailRequest: APIRequest {
    typealias Response = PopularTVResponse.TVShow

    var httpMethod: HTTPMethod = .get
    var path: String = "/3/tv/"

    init(id: Int) {
        path += "\(id)"
    }
}
