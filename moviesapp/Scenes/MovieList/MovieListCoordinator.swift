//
//  MovieListCoordinator.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import UIKit

final class MovieListCoordinator {

    private var navigationController: UINavigationController?

    func start(in window: UIWindow) {
        let viewModel = MovieListViewModel(dataProvider: DataProvider.shared, coordinator: self)
        let viewController = MovieListViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func showDetail(withId id: Int) {
        guard let navigationController else { return }
        let detailCoordinator = MovieDetailCoordinator(navigationController: navigationController)
        detailCoordinator.start(withId: id)
    }
}
