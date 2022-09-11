//
//  FavoriteViewModel.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 11/09/22.
//

import Combine
import Foundation

class FavoriteViewModel: ObservableObject {
    
    @Published private (set) var favoriteList: [Game] = []
    
    private let favoriteService = FavoriteService.shared
    
    func loadFavoritedGames() {
        favoriteService.getAllFavorite { [weak self] favorites in
            self?.favoriteList = favorites
        }
    }
}
