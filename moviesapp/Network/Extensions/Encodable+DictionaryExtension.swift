//
//  File.swift
//  moviesapp
//
//  Created by Turgay Afsar on 26.12.2023.
//

import Foundation

extension Encodable {
    func encodeToDictionary(using keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys) -> [String: Any]? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = keyEncodingStrategy
        guard let data = try? encoder.encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap {
            $0 as? [String: Any]
        }
    }
}
