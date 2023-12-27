//
//  ImageDataProvider.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import UIKit.UIImage

final class ImageDataProvider {

    static let shared: ImageDataProvider = .init()

    private let baseURL = NetworkConfiguration.cdnImageURLString

    private init() {}

    func image(from url: String, completion: @escaping ((UIImage?) -> Void)) {
        guard let url: URL = .init(string: baseURL + url) else { return completion(nil) }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data else { return completion(nil) }
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        }.resume()
    }
}
