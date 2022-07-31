//
//  MainTabView.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 31/07/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            FavoritesScreen()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            
            ProfileScreen()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
