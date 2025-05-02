//
//  ContentView.swift
//  CityExplorerApp
//
//  Created by Francisco Jean on 02/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Explore")
                }

            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
        }
    }
}

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to our app")
            }
            .navigationTitle("World Cities")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Gear pressed")
                    }) {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }
}

struct FavoritesView: View {
    var body: some View {
        Text("Favorites")
    }
}

#Preview {
    ContentView()
}
