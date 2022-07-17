//
//  GameListResponse.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 16/07/22.
//

import Foundation

struct GameListResponse: Decodable {
    let count: Int
    let results: [Game]
}

struct Game: Identifiable, Decodable {
    let id: Int
    let slug: String
    let name: String
    let description: String?
    let backgroundImage: String?
    let genres: [Genre]?
    let rating: Double?
    
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
        // genres: Optional -> [Genre]? -> tipenya optinal, ada kemungkinan nilainya nil
        
        // genreList: Non Optional -> [Genre] -> genres dibungkus jadi variable baru genreList menjadi non optional
        if let genreList = genres,
           !genreList.isEmpty { // check if genres is not nil and not empty
            return genreList.map { $0.name }.joined(separator: " • ")
        }
        return "Unknown" // return Unknown when genres is empty
    }
}

struct Genre: Decodable {
    let name: String
}
