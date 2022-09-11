//
//  FavoritesScreen.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 31/07/22.
//

import SwiftUI

struct FavoritesScreen: View {
    
    @ObservedObject private var viewModel = FavoriteViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                if viewModel.favoriteList.isEmpty {
                    GeometryReader { geometry in
                        VStack(alignment: .leading) {
                            Text("Favorite is empty")
                                .position(
                                    x: geometry.size.width / 2,
                                    y: UIScreen.main.bounds.height / 2
                                )
                        }
                    }
                } else {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(viewModel.favoriteList) { item in
                            NavigationLink(destination: GameDetailScreen(gameID: Int(item.id))) {
                                GameItemView(data: item)
                            }
                        }
                    }
                    .padding(.all, 12)
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                viewModel.loadFavoritedGames()
            }
        }
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
    }
}
