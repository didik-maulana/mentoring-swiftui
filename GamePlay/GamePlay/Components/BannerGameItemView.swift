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
            CustomImage(imageURL: game.imageURL)
            
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
        .frame(width: 340)
        .cornerRadius(12)
    }
}

struct BannerGameItemView_Previews: PreviewProvider {
    static var previews: some View {
        BannerGameItemView(game: Game.dummyData)
            .previewLayout(.fixed(width: 480, height: 320))
    }
}
