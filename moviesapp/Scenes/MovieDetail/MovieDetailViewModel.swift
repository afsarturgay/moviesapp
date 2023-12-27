//
//  MovieDetailViewModel.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    var dataProvider: DataProviderProtocol { get }
    var coordinator: MovieDetailCoordinator { get }
    var refreshViewHandler: ((TVShowPresentation) -> Void)? { get set }
    func viewDidLoad()
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {

    var refreshViewHandler: ((TVShowPresentation) -> Void)?

    var dataProvider: DataProviderProtocol
    var coordinator: MovieDetailCoordinator

    private let id: Int

    init(id: Int, dataProvider: DataProviderProtocol, coordinator: MovieDetailCoordinator) {
        self.id = id
        self.dataProvider = dataProvider
        self.coordinator = coordinator
    }

    func viewDidLoad() {
        fetchMovieDetail()
    }
}

// MARK: - Private Functions
private extension MovieDetailViewModel {
    func fetchMovieDetail() {
        let tvDetailRequest = TVDetailRequest(id: id)
        dataProvider.send(request: tvDetailRequest) { [weak self] response in
            switch response {
            case .success(let result):
                self?.refreshViewHandler?(.init(withTVShow: result))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
