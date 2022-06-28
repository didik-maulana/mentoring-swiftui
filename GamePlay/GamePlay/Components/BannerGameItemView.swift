//
//  BannerGameItemView.swift
//  GamePlay
//
//  Created by Didik on 28/06/22.
//

import SwiftUI

struct BannerGameItemView: View {
    
    let game: Game
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(game.image)
                .resizable()
            
            Rectangle()
                .foregroundColor(.clear)
                .background(
                    LinearGradient(
                        colors: [.black.opacity(0.8), .clear],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(game.name)
                    .foregroundColor(.white)
                    .font(.latoBold(fontSize: 20))
                
                RatingView(
                    rating: game.rating,
                    textColor: .white
                )
            }
            .padding([.leading, .bottom], 16)
        }
        .frame(maxWidth: 340)
        .cornerRadius(12)
    }
}

struct BannerGameItemView_Previews: PreviewProvider {
    static var previews: some View {
        BannerGameItemView(
            game: Game(
                id: 9,
                name: "Life is Strange",
                image: "life-is-strange",
                genre: "Adventure",
                rating: 4.1
            )
        ).previewLayout(.fixed(width: 480, height: 320))
    }
}
