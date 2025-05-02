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

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let url: String
}

struct ExploreView: View {
    
    let countries = [
        Country(name: "Italy", url: "iOS Developer"),
        Country(name: "United States", url: "UX Designer"),
        Country(name: "France", url: ""),
        Country(name: "Spain", url: ""),
        Country(name: "Germany", url: ""),
        Country(name: "Mexico", url: "")
    ]
    

    let columns = [
        GridItem(.flexible()),  
        GridItem(.flexible())
    ]
    
    var body: some View {       
        NavigationView {
            VStack {
                Text("Welcome to our app")
                Spacer()
                LazyVGrid(columns: columns) {
                    ForEach(countries) { country in
                        VStack {
                            Image(country.url)
                            Text(country.name)
                                .font(.custom("Roboto", size: 20))
                        }
                    }
                }
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
