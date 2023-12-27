//
//  RatingView.swift
//  moviesapp
//
//  Created by Turgay Afsar on 27.12.2023.
//

import UIKit

final class RatingView: UIView {

    var text: String? {
        get {
            ratingLabel.text
        } set {
            ratingLabel.text = newValue
        }
    }

    private lazy var ratingLabel: UILabel = createRatingLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureView()
        layoutRatingLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Functions
private extension RatingView {

    func configureView() {
        backgroundColor = .systemYellow
    }

    func layoutRatingLabel() {
        addSubview(ratingLabel)
        NSLayoutConstraint.activate([
            ratingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ratingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    func createRatingLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }
}
