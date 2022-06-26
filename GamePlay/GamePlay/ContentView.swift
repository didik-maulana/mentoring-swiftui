//
//  ContentView.swift
//  GamePlay
//
//  Created by Didik on 25/06/22.
//

import SwiftUI

struct ContentView: View {
    
    let viewModel = GameViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(viewModel.gameList) { item in
                        GameItemView(data: item)
                    }
                }
                .padding(.all, 12)
            }
            .navigationTitle("GamePlay")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
