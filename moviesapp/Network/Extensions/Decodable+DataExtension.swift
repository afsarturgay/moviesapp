//
//  DecodableExtension.swift
//  moviesapp
//
//  Created by Turgay Afsar on 26.12.2023.
//

import Foundation

extension Decodable {
    init?(from data: Data, with decoder: JSONDecoder = .init()) {
        // TODO: - handle throws
        guard let parsed = try? decoder.decode(Self.self, from: data) else { return nil }
        self = parsed
    }
}
