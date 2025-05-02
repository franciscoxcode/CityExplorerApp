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
    let description: String
}

struct ExploreView: View {
    
    let countries = [
        Country(name: "Italy", url: "italy", description: "Lorem ipsum dolor sit amet"),
        Country(name: "United States", url: "usa", description: "Lorem ipsum dolor sit amet"),
        Country(name: "France", url: "france", description: "Lorem ipsum dolor sit amet"),
        Country(name: "Spain", url: "spain", description: "Lorem ipsum dolor sit amet"),
        Country(name: "Germany", url: "germany", description: "Lorem ipsum dolor sit amet"),
        Country(name: "Mexico", url: "mexico", description: "Lorem ipsum dolor sit amet")
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
                        NavigationLink (destination: CountryDetailView(country: country)) {
                            VStack {
                            Image(country.url)
                                    .resizable()
                                    .scaledToFit()
                                Text(country.name)
                                    .font(.custom("Roboto", size: 20))
                            }
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

struct CountryDetailView: View {
    let country: Country
    
    var body: some View {
        VStack() {
            Image(country.url)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Text (country.name)
                .font(.title)
            
            Text(country.description)
                .padding()
        }
        .navigationTitle(country.name)
        .navigationBarTitleDisplayMode(.inline)
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
