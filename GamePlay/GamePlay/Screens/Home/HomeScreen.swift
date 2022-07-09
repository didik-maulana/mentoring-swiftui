//
//  HomeScreen.swift
//  GamePlay
//
//  Created by Didik on 25/06/22.
//

import SwiftUI

struct HomeScreen: View {
    
    let viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack(alignment: .leading, spacing: 24) {
                    Text("Recommendation for you")
                        .font(.latoBold(fontSize: 24))
                        .foregroundColor(.black)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top, spacing: 16) {
                            ForEach(viewModel.gameList) { item in
                                BannerGameItemView(game: item)
                            }
                        }
                    }
                    .aspectRatio(4 / 2, contentMode: .fill)
                    
                    Text("Popular Games")
                        .font(.latoBold(fontSize: 24))
                        .foregroundColor(.black)
                    
                    ForEach(viewModel.gameList) { item in
                        NavigationLink(destination: GameDetailScreen(game: item)) {
                            GameItemView(data: item)
                        }
                    }
                }
                .padding(.all, 12)
            }
            .navigationTitle("GamePlay")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
