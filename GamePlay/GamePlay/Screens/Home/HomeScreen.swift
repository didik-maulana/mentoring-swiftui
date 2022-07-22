//
//  HomeScreen.swift
//  GamePlay
//
//  Created by Didik on 25/06/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack(alignment: .leading, spacing: 24) {
                    Text("Popular Games")
                        .font(.latoBold(fontSize: 24))
                        .foregroundColor(.black)
                    
                    if viewModel.isLoadingPopularGames {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(
                                maxWidth: .infinity,
                                minHeight: 170,
                                alignment: .center
                            )
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(alignment: .top, spacing: 16) {
                                ForEach(viewModel.popularGames) { item in
                                    NavigationLink(destination: GameDetailScreen(gameID: item.id)) {
                                        BannerGameItemView(game: item)
                                    }
                                }
                            }
                        }
                        .aspectRatio(4 / 2, contentMode: .fill)
                    }
                    
                    Text("Top Rated Games")
                        .font(.latoBold(fontSize: 24))
                        .foregroundColor(.black)
                    
                    if viewModel.isLoadingTopRatedGames {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(
                                maxWidth: .infinity,
                                minHeight: 200,
                                alignment: .center
                            )
                    } else {
                        ForEach(viewModel.topRatedGames) { item in
                            NavigationLink(destination: GameDetailScreen(gameID: item.id)) {
                                GameItemView(data: item)
                            }
                        }
                    }
                }
                .padding(.all, 12)
            }
            .navigationTitle("GamePlay")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                if viewModel.popularGames.isEmpty {
                    viewModel.loadPopularGames()
                }
                
                if viewModel.topRatedGames.isEmpty {
                    viewModel.loadTopRatedGames()
                }
            }
            .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
                Alert(
                    title: Text(viewModel.errorMessage ?? ""),
                    dismissButton: .default(Text("Retry"), action: {
                        if viewModel.popularGames.isEmpty {
                            viewModel.loadPopularGames()
                        }
                        
                        if viewModel.topRatedGames.isEmpty {
                            viewModel.loadTopRatedGames()
                        }
                    })
                )
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
