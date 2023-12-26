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
        let originalName: String
        let overview: String
        let voteAverage: Double
        let posterPath: String
    }
}
