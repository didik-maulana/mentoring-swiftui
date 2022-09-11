//
//  GameDetailScreen.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 09/07/22.
//

import SwiftUI

struct GameDetailScreen: View {
    
    @ObservedObject private var viewModel = GameDetailViewModel()
    
    let gameID: Int
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height,
                        alignment: .center)
            } else {
                CustomImage(imageURL: viewModel.game?.imageURL)
                    .frame(height: 200)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.game?.name ?? "")
                        .font(.latoBold(fontSize: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(viewModel.game?.genreText ?? "")
                        .font(.latoLight(fontSize: 16))
                        .foregroundColor(.tundora)
                        .lineLimit(1)
                    
                    RatingView(
                        rating: viewModel.game?.rating ?? 0,
                        textColor: .tundora
                    )
                    
                    Link("Open in Browser", destination: (viewModel.game?.url)!)
                        .padding(.top, 8)
                    
                    PrimaryButton(
                        title: "Add Favorite",
                        onTapButtonAction: {
                            viewModel.toggleFavorite()
                        }
                    ).padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                    Text(viewModel.game?.description ?? "")
                        .font(.latoRegular(fontSize: 16))
                        .foregroundColor(.tundora)
                        .padding(.vertical, 16)
                }
                .padding(.horizontal, 16)
            }
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
        .onAppear {
            viewModel.loadGameDetail(gameID: gameID)
        }
    }
    
    func shareGame() {
        guard let gameURL = viewModel.game?.url else {
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
            GameDetailScreen(gameID: Game.dummyData.id)
        }
    }
}
