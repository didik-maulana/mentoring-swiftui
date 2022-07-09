//
//  Game.swift
//  GamePlay
//
//  Created by Didik on 25/06/22.
//

import Foundation

struct Game: Identifiable {
    let id: Int
    let slug: String
    let name: String
    let description: String
    let image: String
    let genre: String
    let rating: Double
    
    var url: URL? {
        return URL(string: "https://rawg.io/games/\(slug)")
    }
}
