//
//  GameDetailScreen.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 09/07/22.
//

import SwiftUI

struct GameDetailScreen: View {
    
    let game: Game
    
    var body: some View {
        ScrollView {
            CustomImage(imageURL: game.imageURL)
                .frame(height: 200)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(game.name)
                    .font(.latoBold(fontSize: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(game.genreText)
                    .font(.latoLight(fontSize: 16))
                    .foregroundColor(.tundora)
                    .lineLimit(1)
                
                RatingView(
                    rating: game.rating,
                    textColor: .tundora
                )
                
                Link("Open in Browser", destination: game.url!)
                    .padding(.top, 8)
                
                Divider()
                    .padding(.top, 12)
                
                Text(game.description ?? "")
                    .font(.latoRegular(fontSize: 16))
                    .foregroundColor(.tundora)
                    .padding(.vertical, 16)
            }
            .padding(.horizontal, 16)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: shareGame) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.blue)
                }
            }
        }
    }
    
    func shareGame() {
        guard let gameURL = game.url else {
            print("URL not found!")
            return
        }
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let activityVC = UIActivityViewController(
            activityItems: [gameURL],
            applicationActivities: nil
        )
        window?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct GameDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameDetailScreen(game: Game.dummyData)
        }
    }
}
