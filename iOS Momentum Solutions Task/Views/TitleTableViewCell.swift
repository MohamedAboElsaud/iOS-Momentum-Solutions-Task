//
//  TitleTableViewCell.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 26/07/2025.
//

import UIKit
import SDWebImage

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"


    let posterImageView = UIImageView()
    let titleLabel = UILabel()
    let ratingLabel = UILabel()
    let releaseDateLabel = UILabel()
    let favoriteButton = UIButton(type: .system)

    var onToggleFavorite: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true
        posterImageView.layer.cornerRadius = 8

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 2

        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = .systemFont(ofSize: 14)
        ratingLabel.textColor = .darkGray

        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.font = .systemFont(ofSize: 14)
        releaseDateLabel.textColor = .darkGray

        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        favoriteButton.tintColor = .systemYellow
        favoriteButton.addTarget(self, action: #selector(favoriteTapped), for: .touchUpInside)

        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(favoriteButton)

        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            posterImageView.widthAnchor.constraint(equalToConstant: 80),
            posterImageView.heightAnchor.constraint(equalToConstant: 120),

            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -8),

            ratingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            ratingLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

            releaseDateLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 4),
            releaseDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

            favoriteButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    @objc private func favoriteTapped() {
        onToggleFavorite?()
    }

    func configure(with movie: Title) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "" )") else {return}
        posterImageView.sd_setImage(with: url, completed: nil)

        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.voteAverage ?? 0 )"
        releaseDateLabel.text = "Release: \(movie.releaseDate ?? "NA")"

        let favoriteIcon = movie.adult ?? false ? "star.fill" : "star"
        favoriteButton.setImage(UIImage(systemName: favoriteIcon), for: .normal)
    }
}
