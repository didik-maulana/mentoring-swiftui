//
//  RatingView.swift
//  GamePlay
//
//  Created by Didik on 28/06/22.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    let textColor: Color
    
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(.orangeLight)
            
            Text(String(format: "%.1f", rating))
                .font(.latoRegular(fontSize: 18))
                .foregroundColor(textColor)
                .lineLimit(1)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4, textColor: .tundora)
            .previewLayout(.sizeThatFits)
    }
}
