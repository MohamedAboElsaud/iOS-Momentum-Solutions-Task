//
//  TitlePreviewViewController.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 27/07/2025.
//

import UIKit
import WebKit

import UIKit
import SwiftUICore

class TitlePreviewViewController: UIViewController {

    var movie: Title
    var onFavoriteToggle: ((Title) -> Void)?

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let posterImageView = UIImageView()
    private let titleLabel = UILabel()
    private let ratingLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let overviewLabel = UILabel()
    private let voteAverageLabel = UILabel()
    private let languageLabel = UILabel()
    private let favoriteButton = UIButton(type: .system)

    init(movie: Title, onFavoriteToggle: ((Title) -> Void)? = nil) {
        self.movie = movie
        self.onFavoriteToggle = onFavoriteToggle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

  
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie Details"
        view.backgroundColor = .systemBackground
        setupUI()
        configureContent()
    }

    private func setupUI() {
        // ScrollView setup
              scrollView.translatesAutoresizingMaskIntoConstraints = false
              contentView.translatesAutoresizingMaskIntoConstraints = false
              view.addSubview(scrollView)
              scrollView.addSubview(contentView)

              NSLayoutConstraint.activate([
                  scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                  scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                  scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                  scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

                  contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                  contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                  contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                  contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                  contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
              ])

              // UI Elements
              [posterImageView, titleLabel, ratingLabel, releaseDateLabel, voteAverageLabel, languageLabel, overviewLabel, favoriteButton]
                  .forEach {
                      $0.translatesAutoresizingMaskIntoConstraints = false
                      contentView.addSubview($0)
                  }

              posterImageView.contentMode = .scaleAspectFill
              posterImageView.clipsToBounds = true
              posterImageView.backgroundColor = .darkGray

              titleLabel.font = .boldSystemFont(ofSize: 24)
              titleLabel.numberOfLines = 0

              ratingLabel.font = .systemFont(ofSize: 16)
              ratingLabel.textColor = .lightGray

              releaseDateLabel.font = .systemFont(ofSize: 16)
              releaseDateLabel.textColor = .lightGray

              voteAverageLabel.font = .systemFont(ofSize: 16)
              voteAverageLabel.textColor = .lightGray

              languageLabel.font = .systemFont(ofSize: 16)
              languageLabel.textColor = .lightGray

              overviewLabel.font = .systemFont(ofSize: 16)
        overviewLabel.textColor = .lightGray
              overviewLabel.numberOfLines = 0


              favoriteButton.setTitleColor(.systemRed, for: .normal)
              favoriteButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
             // favoriteButton.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)

              NSLayoutConstraint.activate([
                  posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                  posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                  posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                  posterImageView.heightAnchor.constraint(equalToConstant: 250),

                  titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 16),
                  titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                  titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

                  ratingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                  ratingLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

                  releaseDateLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 4),
                  releaseDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

                  voteAverageLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 4),
                  voteAverageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

                  languageLabel.topAnchor.constraint(equalTo: voteAverageLabel.bottomAnchor, constant: 4),
                  languageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

                  overviewLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 16),
                  overviewLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                  overviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

                  favoriteButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 24),
                  favoriteButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                  favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
              ])
          }
    func configureContent() {
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.voteAverage ?? 0)"
        releaseDateLabel.text = "Release Date: \(movie.releaseDate ?? "")"
        overviewLabel.text = "Overview:\n\(movie.overview ?? "" )"
        voteAverageLabel.text = "Vote Average: \(movie.voteAverage ?? 0)"
        languageLabel.text = "Original Language: \(movie.originalLanguage ?? "" )"
        //updateFavoriteButton()

        guard let url = URL(string:"https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")") else{return}
        posterImageView.sd_setImage(with: url)
//        posterImageView.image = UIImage(systemName: "film") // Placeholder
    }

//    @objc private func favoriteTapped() {
//        //movie.isFavorite.toggle()
//        updateFavoriteButton()
//        onFavoriteToggle?(movie)
//    }
//
//    private func updateFavoriteButton() {
//        let title = movie.adult ?? false ? "Unfavorite" : "Favorite"
//        favoriteButton.setTitle(title, for: .normal)
//    }
}
//
//class TitlePreviewViewController: UIViewController {
//    
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 22, weight: .bold)
//        return label
//    }()
//    
//    private let overviewLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 18, weight: .regular)
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let downloadButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .red
//        button.setTitle("Download", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        return button
//    }()
//    
//    private let webview: WKWebView = {
//        let webView = WKWebView()
//        webView.translatesAutoresizingMaskIntoConstraints = false
//        return webView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        view.addSubview(webview)
//        view.addSubview(titleLabel)
//        view.addSubview(overviewLabel)
//        view.addSubview(downloadButton)
//        
//        configureConstraints()
//    }
//    
//    func configureConstraints() {
//        let webViewConstraints = [
//            webview.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            webview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            webview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            webview.heightAnchor.constraint(equalToConstant: 250)
//        ]
//        
//        let titleLabelConstraints = [
//            titleLabel.topAnchor.constraint(equalTo: webview.bottomAnchor, constant: 25),
//            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
//        ]
//        
//        let overviewLabelConstraint = [
//            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
//            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ]
//        
//        let downloadButtonConstraints = [
//            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25)
//        ]
//        
//        
//        NSLayoutConstraint.activate(webViewConstraints)
//        NSLayoutConstraint.activate(titleLabelConstraints)
//        NSLayoutConstraint.activate(overviewLabelConstraint)
//        NSLayoutConstraint.activate(downloadButtonConstraints)
//    }
//    
//    func configure(with model: TitlePreviewViewModel) {
//        titleLabel.text = model.titleLabel
//        overviewLabel.text = model.overViewLabel
//        
//        guard let url = URL(string: "https://youtube.com/embed/\(String(describing: model.youtubeView.id?.videoId))") else {return}
//        
//        webview.load(URLRequest(url: url))
//    }
//    
//
//}
