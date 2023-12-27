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

    func showDetail() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        navigationController?.pushViewController(viewController, animated: true)
    }
}
