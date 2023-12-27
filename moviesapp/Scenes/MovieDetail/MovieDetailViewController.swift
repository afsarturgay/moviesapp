//
//  MovieDetailViewController.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    private var viewModel: MovieDetailViewModelProtocol

    init(viewModel: MovieDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
