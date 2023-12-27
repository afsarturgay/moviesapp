//
//  PopularTVResponse.swift
//  moviesapp
//
//  Created by Turgay Afsar on 26.12.2023.
//

import Foundation

struct PopularTVResponse: Decodable {
    let results: [TVShow]
}

extension PopularTVResponse {
    struct TVShow: Decodable {
        let id: Int
        let originalName: String
        let overview: String
        let voteAverage: Double
        let posterPath: String
        let date: String

        enum CodingKeys: String, CodingKey {
            case id
            case originalName
            case overview
            case voteAverage
            case posterPath
            case date = "firstAirDate"
        }
    }
}
