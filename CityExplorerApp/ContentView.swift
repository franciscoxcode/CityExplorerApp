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
        Country(name: "Italy", url: "italy"),
        Country(name: "United States", url: "usa"),
        Country(name: "France", url: "france"),
        Country(name: "Spain", url: "spain"),
        Country(name: "Germany", url: "germany"),
        Country(name: "Mexico", url: "mexico")
    ]
    

    let columns = [
        GridItem(.flexible()),  
        GridItem(.flexible())
    ]
    
    var body: some View {       
        NavigationView {
            VStack {
                Text("Welcome to our app")
                    .font(.title2)
                Spacer()
                LazyVGrid(columns: columns) {
                    ForEach(countries) { country in
                        VStack {
                            Image(country.url)
                                .resizable()
                                .scaledToFit()
                            Text(country.name)
                                .font(.custom("Roboto", size: 20))
                        }
                        
                    }
                }
                Spacer()
            }
            .padding()
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
