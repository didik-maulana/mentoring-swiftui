//
//  Game.swift
//  GamePlay
//
//  Created by Didik on 25/06/22.
//

import Foundation

struct Game: Identifiable, Decodable {
    let id: Int
    let slug: String
    let name: String
    let description: String?
    let backgroundImage: String?
    let genres: [Genre]?
    let rating: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
        case description
        case backgroundImage = "background_image"
        case genres
        case rating
    }
    
    var url: URL? {
        return URL(string: "https://rawg.io/games/\(slug)")
    }
    
    var imageURL: URL? {
        return URL(string: backgroundImage ?? "unknown")
    }
    
    var genreText: String {
        if let genres = genres, !genres.isEmpty {
            return genres.map { $0.name }.joined(separator: " • ")
        }
        return "Unknown"
    }
}

struct Genre: Decodable {
    let name: String
}
