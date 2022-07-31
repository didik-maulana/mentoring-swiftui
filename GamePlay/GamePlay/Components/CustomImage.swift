//
//  CustomImage.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 14/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomImage: View {
    
    let imageURL: URL?
    
    var body: some View {
        WebImage(url: imageURL)
            .resizable()
            .placeholder {
                ZStack {
                    Color.gray.opacity(0.2)
                    
                    Text("NO IMAGE")
                        .foregroundColor(.tundora)
                }
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(imageURL: Game.dummyData.imageURL)
            .previewLayout(.sizeThatFits)
    }
}
