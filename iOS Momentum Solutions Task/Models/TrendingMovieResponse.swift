//
//  Movie.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 24/07/2025.
//

import Foundation


// MARK: - Welcome
struct AllData : Codable {
    let page: Int?
    let results: [Title]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Title: Codable {
    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let title, originalLanguage, originalTitle, overview: String?
    let posterPath: String?
    let mediaType: MediaType?
    let genreIDS: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

///"adult":false,"backdrop_path":"/s94NjfKkcSczZ1FembwmQZwsuwY.jpg","id":617126,"title":"The Fantastic Four: First Steps","original_title":"The Fantastic Four: First Steps","overview":"Against the vibrant backdrop of a 1960s-inspired, retro-futuristic world, Marvel's First Family is forced to balance their roles as heroes with the strength of their family bond, while defending Earth from a ravenous space god called Galactus and his enigmatic Herald, Silver Surfer.","poster_path":"/x26MtUlwtWD26d0G0FXcppxCJio.jpg","media_type":"movie","original_language":"en","genre_ids":[878,12],"popularity":194.6445,"release_date":"2025-07-23","video":false,"vote_average":7.047,"vote_count":137},
