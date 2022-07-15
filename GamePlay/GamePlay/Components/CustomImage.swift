//
//  CustomImage.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 14/07/22.
//

import SwiftUI

struct CustomImage: View {
    
    let imageURL: URL?
    
    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ZStack {
                    Color.gray.opacity(0.2)
                    
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            case .success(let image):
                image.resizable()
            case .failure:
                ZStack {
                    Color.gray.opacity(0.2)
                    
                    Text("NO IMAGE")
                        .foregroundColor(.tundora)
                }
            default:
                EmptyView()
            }
        }
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(imageURL: Game.dummyData.imageURL)
            .previewLayout(.sizeThatFits)
    }
}
