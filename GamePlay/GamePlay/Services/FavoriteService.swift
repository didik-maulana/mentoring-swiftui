//
//  FavoriteService.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 11/09/22.
//

import Foundation
import Combine
import CoreData

class FavoriteService {
    static let shared = FavoriteService()
    
    let persistentContainer = NSPersistentContainer(name: "Favorite")
    
    init() {
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func saveData() {
        guard persistentContainer.viewContext.hasChanges else { return }
        
        do {
            try persistentContainer.viewContext.save()
            print("Data saved!")
        } catch {
            print("We could not save the data...")
        }
    }
    
    func addFavorite(game: Game) {
        let favorite = Favorite(context: persistentContainer.viewContext)
        favorite.id = Int64(game.id)
        favorite.name = game.name
        favorite.image = game.backgroundImage
        favorite.genre = game.genreText
        favorite.rating = game.rating
        
        saveData()
    }
    
    func getAllFavorite(completion: @escaping ([Game]) -> Void) {
        persistentContainer.viewContext.perform {
            do {
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorite")
                let favoriteList = try self.persistentContainer.viewContext.fetch(fetchRequest) as? [Favorite]
                var gameList: [Game] = []
                
                for favorite in favoriteList ?? [] {
                    let game = Game(
                        id: Int(favorite.id),
                        slug: "",
                        name: favorite.name ?? "",
                        description: nil,
                        backgroundImage: favorite.image,
                        genres: self.mapGenreList(text: favorite.genre),
                        rating: favorite.rating)
                    gameList.append(game)
                }
                completion(gameList)
            } catch let error {
                completion([])
                print("Could not get all favorite. \(error)")
            }
        }
    }
    
    func mapGenreList(text: String?) -> [Genre] {
        return text?.components(separatedBy: " • ").map {
            Genre(name: $0)
        } ?? []
    }
}
