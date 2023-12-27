//
//  MovieListCell.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import UIKit

final class MovieListCell: UITableViewCell {

    private lazy var posterImageView: UIImageView = createImageView()
    private lazy var titleLabel: UILabel = createTitleLabel()
    private lazy var descriptionLabel: UILabel = createDescriptionLabel()
    private lazy var dateLabel: UILabel = createDateLabel()
    private lazy var contentStackView: UIStackView = createContentStackView()
    private lazy var stackView: UIStackView = createStackView()
    private lazy var ratingView: RatingView = createRatingView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        layoutView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with presentation: TVShowPresentation) {
        titleLabel.text = presentation.title
        descriptionLabel.text = presentation.description
        dateLabel.text = presentation.date
        ratingView.text = presentation.rating

        // TODO: - Move to extension or create Image provider
        let url: URL = .init(string: "https://image.tmdb.org/t/p/w500" + presentation.imageURL)!
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data {
                DispatchQueue.main.async {
                    self.posterImageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}

// MARK: = Private Functions
private extension MovieListCell {

    func configureView() {
        selectionStyle = .none
    }

    func layoutView() {
        layoutImageView()
        layoutRatingView()
        layoutContentStackView()
    }

    func layoutContentStackView() {
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }

    func layoutImageView() {
        NSLayoutConstraint.activate([
            posterImageView.widthAnchor.constraint(equalToConstant: 80),
            posterImageView.heightAnchor.constraint(equalToConstant: 80),
        ])
    }

    func layoutRatingView() {
        NSLayoutConstraint.activate([
            ratingView.widthAnchor.constraint(equalToConstant: 30),
            ratingView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }

    func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }

    func createStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [
            posterImageView,
            contentStackView,
            ratingView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .top
        stackView.distribution = .fillProportionally
        return stackView
    }

    func createContentStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            descriptionLabel,
            dateLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .top
        return stackView
    }

    func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }

    func createDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }

    func createDateLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 10)
        return label
    }

    func createRatingView() -> RatingView {
        let view = RatingView()
        view.layer.cornerRadius = 15
        return view
    }
}
