//
//  MovieDetailViewController.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    private lazy var posterImageView: UIImageView = createPosterImageView()
    private lazy var titleLabel: UILabel = createTitleLabel()
    private lazy var descriptionLabel: UILabel = createDescriptionLabel()
    private lazy var ratingView: RatingView = createRatingView()
    private lazy var contentStackView: UIStackView = createContentStackView()

    private var viewModel: MovieDetailViewModelProtocol
    

    init(viewModel: MovieDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layoutPosterImageView()
        layoutRatingView()
        layoutContentStackView()

        viewModel.refreshViewHandler = { tvShow in

            ImageDataProvider.shared.image(from: tvShow.imageURL) { [weak self] image in
                self?.posterImageView.image = image
            }

            self.titleLabel.text = tvShow.title
            self.descriptionLabel.text = tvShow.description
            self.ratingView.text = tvShow.rating
        }

        viewModel.viewDidLoad()
    }
}

// MARK: - Private Functions
private extension MovieDetailViewController {
    func layoutPosterImageView() {
        view.addSubview(posterImageView)
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: view.topAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalTo: posterImageView.widthAnchor, multiplier: 4/3)
        ])
    }

    func layoutRatingView() {
        view.addSubview(ratingView)

        NSLayoutConstraint.activate([
            ratingView.heightAnchor.constraint(equalToConstant: 30),
            ratingView.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

    func layoutContentStackView() {
        view.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            contentStackView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            //contentStackView.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor),
        ])
    }

    func createPosterImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }

    func createContentStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            descriptionLabel,
            ratingView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .top
        return stackView
    }

    func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }

    func createDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }

    func createRatingView() -> RatingView {
        let view = RatingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }
}
