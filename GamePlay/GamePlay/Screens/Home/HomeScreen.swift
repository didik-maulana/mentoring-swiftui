//
//  HomeScreen.swift
//  GamePlay
//
//  Created by Didik on 25/06/22.
//

import SwiftUI

struct HomeScreen: View {
    
    ///***
    ///ObservedObject digunakan untuk memungkinkan HomeScreen dapat melakukan subscribe ke viewModel, sehingga ketika terjadi perubahan data @Published di viewModel, UI dapat menerima value terbaru dan melakukan re-render UI.
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
                                    NavigationLink(destination: GameDetailScreen(game: item)) {
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
                            NavigationLink(destination: GameDetailScreen(game: item)) {
                                GameItemView(data: item)
                            }
                        }
                    }
                }
                .padding(.all, 12)
            }
            .navigationTitle("GamePlay")
            .navigationBarTitleDisplayMode(.large)
            .onAppear { // ke trigger ketika halaman ditampilkan
                if viewModel.popularGames.isEmpty {
                    viewModel.loadPopularGames()
                }
                
                if viewModel.topRatedGames.isEmpty {
                    viewModel.loadTopRatedGames()
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
