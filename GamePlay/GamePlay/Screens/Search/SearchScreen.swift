//
//  SearchScreen.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 28/08/22.
//

import SwiftUI

struct SearchScreen: View {
    
    @ObservedObject private var viewModel = SearchViewModel()
    @State private var searchKeyword: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .center, spacing: 0) {
                    // Komponen Search
                    HStack(alignment: .center, spacing: 8) {
                        TextField("Search game..", text: $searchKeyword)
                            .font(.latoRegular(fontSize: 14))
                            .foregroundColor(.textFieldColor)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 30)
                            .background(Color.textFieldBackground)
                            .cornerRadius(20)
                            .keyboardType(.default)
                        
                        Button {
                            viewModel.searchGame(keyword: searchKeyword)
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 24)
                        .frame(width: 80, height: 60)
                        .background(Color.buttonColor)
                        .cornerRadius(20)
                    }
                    .padding(.bottom, 24)
                    
                    if viewModel.isLoading {
                        // Loading State
                        ProgressView()
                            .progressViewStyle(.circular)
                            .padding(.top, 250)
                    } else if viewModel.isEmptySearch {
                        // Empty State
                        Text("Game not found..")
                            .font(.latoBold(fontSize: 24))
                            .foregroundColor(.tundora)
                            .padding(.top, 250)
                    } else {
                        // Game List
                        Text("Search found \(viewModel.gameList.count) games")
                            .font(.latoRegular(fontSize: 16))
                            .foregroundColor(.tundora)
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .padding(.bottom, 12)
                        
                        LazyVStack(alignment: .leading, spacing: 16) {
                            ForEach(viewModel.gameList) { item in
                                NavigationLink(destination: GameDetailScreen(gameID: item.id)) {
                                    GameItemView(data: item)
                                }
                            }
                        }
                    }
                }
                .padding(.all, 12)
            }
            .navigationBarHidden(true)
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
