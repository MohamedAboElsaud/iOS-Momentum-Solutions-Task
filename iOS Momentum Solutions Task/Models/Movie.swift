//
//  Movie.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 24/07/2025.
//

import Foundation

struct TrendingMovieResponse: Codable{
    let results: [Movie]
}

struct Movie: Codable{

    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double


}
///"adult":false,"backdrop_path":"/s94NjfKkcSczZ1FembwmQZwsuwY.jpg","id":617126,"title":"The Fantastic Four: First Steps","original_title":"The Fantastic Four: First Steps","overview":"Against the vibrant backdrop of a 1960s-inspired, retro-futuristic world, Marvel's First Family is forced to balance their roles as heroes with the strength of their family bond, while defending Earth from a ravenous space god called Galactus and his enigmatic Herald, Silver Surfer.","poster_path":"/x26MtUlwtWD26d0G0FXcppxCJio.jpg","media_type":"movie","original_language":"en","genre_ids":[878,12],"popularity":194.6445,"release_date":"2025-07-23","video":false,"vote_average":7.047,"vote_count":137},
