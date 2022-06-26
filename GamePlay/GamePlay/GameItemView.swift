//
//  GameItemView.swift
//  GamePlay
//
//  Created by Didik on 25/06/22.
//

import SwiftUI

struct GameItemView: View {
    
    let data: Game
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(data.image)
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(12)
                .shadow(
                    color: .gray.opacity(0.5),
                    radius: 2,
                    x: 2,
                    y: 4
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(data.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("tundora"))
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .lineLimit(1)
                
                Text(data.genre)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                HStack(alignment: .top, spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("orange"))
                    
                    Text(String(format: "%.1f", data.rating))
                        .font(.body)
                        .foregroundColor(.black)
                        .lineLimit(1)
                }
            }
        }
    }
}

struct GameItemView_Previews: PreviewProvider {
    static var previews: some View {
        GameItemView(
            data: Game(
                id: 9,
                name: "Life is Strange",
                image: "life-is-strange",
                genre: "Adventure",
                rating: 4.1
            )
        )
    }
}
