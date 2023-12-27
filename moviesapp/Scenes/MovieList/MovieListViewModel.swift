//
//  MovieListViewModel.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import Foundation

protocol MovieListViewModelProtocol {
    var dataProvider: DataProviderProtocol { get }
    var coordinator: MovieListCoordinator { get }
    var screenTitle: String { get }
    var refreshViewHandler: (() -> Void)? { get set }
    var errorHandler: ((String) -> Void)? { get set }
    var numberOfItems: Int { get }
    func viewDidLoad()
    func cellPresentation(forIndex indexPath: IndexPath) -> TVShowPresentation?
    func didSelectMovie(atIndexPath indexPath: IndexPath)
}

final class MovieListViewModel: MovieListViewModelProtocol {

    var screenTitle: String {
        "Popular TV Shows"
    }

    var refreshViewHandler: (() -> Void)?
    var errorHandler: ((String) -> Void)?

    var numberOfItems: Int {
        cellPresentations.count
    }

    let dataProvider: DataProviderProtocol
    let coordinator: MovieListCoordinator

    private var tvShows: [PopularTVResponse.TVShow] = [] {
        didSet {
            cellPresentations = tvShows.map {
                .init(withTVShow: $0)
            }
        }
    }

    private var cellPresentations: [TVShowPresentation] = []

    init(dataProvider: DataProviderProtocol, coordinator: MovieListCoordinator) {
        self.dataProvider = dataProvider
        self.coordinator = coordinator
    }

    func viewDidLoad() {
        fetchTVShows()
    }

    func cellPresentation(forIndex indexPath: IndexPath) -> TVShowPresentation? {
        // TODO: - Create an extension for safe subscript
        cellPresentations[indexPath.row]
    }

    func didSelectMovie(atIndexPath indexPath: IndexPath) {
        let id = tvShows[indexPath.row].id
        coordinator.showDetail(withId: id)
    }
}

// MARK: - Private Functions
private extension MovieListViewModel {
    func fetchTVShows() {
        let popularTVRequest = PopularTVRequest()
        dataProvider.send(request: popularTVRequest) { [weak self] response in
            switch response {
            case .success(let result):
                self?.tvShows = result.results
                self?.refreshViewHandler?()
            case .failure(let error):
                self?.errorHandler?(error.localizedDescription)
            }
        }
    }
}

extension TVShowPresentation {

    init(withTVShow tvShow: PopularTVResponse.TVShow) {
        title = tvShow.originalName
        description = tvShow.overview
        imageURL = tvShow.posterPath
        // TODO: - Format date
        date = tvShow.date
        rating = String(format: "%.1f", tvShow.voteAverage)
    }
}
