//
//  MovieDetailViewModel.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    var dataProvider: DataProviderProtocol { get }
    var coordinator: MovieListCoordinator { get }
    func viewDidLoad()
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {

    var dataProvider: DataProviderProtocol
    var coordinator: MovieListCoordinator

    init(dataProvider: DataProviderProtocol, coordinator: MovieListCoordinator) {
        self.dataProvider = dataProvider
        self.coordinator = coordinator
    }

    func viewDidLoad() {

    }
}
