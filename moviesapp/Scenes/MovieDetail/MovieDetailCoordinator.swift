//
//  MovieDetailCoordinator.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import UIKit

final class MovieDetailCoordinator {

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(withId id: Int) {
        let viewModel = MovieDetailViewModel(
            id: id,
            dataProvider: DataProvider.shared,
            coordinator: self)
        let viewController = MovieDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
