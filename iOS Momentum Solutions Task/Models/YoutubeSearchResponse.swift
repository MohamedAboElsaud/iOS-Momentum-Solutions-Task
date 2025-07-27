//
//  YoutubeSearchResponse.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 26/07/2025.
//


import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]?
}


struct VideoElement: Codable {
    let id: IdVideoElement?
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String?
}