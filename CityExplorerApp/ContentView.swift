//
//  ContentView.swift
//  CityExplorerApp
//
//  Created by Francisco Jean on 02/05/25.
//

import SwiftUI

struct ContentView: View {
    
    
        @State private var countries = [
            Country(name: "Italy", url: "italy", description: "Lorem ipsum dolor sit amet", favorite: false),
            Country(name: "United States", url: "usa", description: "Lorem ipsum dolor sit amet", favorite: false),
            Country(name: "France", url: "france", description: "Lorem ipsum dolor sit amet", favorite: false),
            Country(name: "Spain", url: "spain", description: "Lorem ipsum dolor sit amet", favorite: false),
            Country(name: "Germany", url: "germany", description: "Lorem ipsum dolor sit amet", favorite: false),
            Country(name: "Mexico", url: "mexico", description: "Lorem ipsum dolor sit amet", favorite: false)
        ]
    
    var body: some View {
        TabView {
            ExploreView(countries: $countries)
                .tabItem {
                    Image(systemName: "globe")
                    Text("Explore")
                }
            FavoritesView(countries: $countries)
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
    var favorite: Bool
}
    
struct ExploreView: View {
    @Binding var countries: [Country]
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
                    ForEach($countries) { $country in
                        NavigationLink(destination: CountryDetailView(countries: $countries)) {
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
    @Binding var countries: [Country]
    
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
            Button(action: {
                country.favorite.toggle()
            }) {
                Image(systemName: country.favorite ? "heart.fill" : "heart")
                    .foregroundStyle(country.favorite ? .red : .gray)
                Text(country.favorite ? "Remove from favorites" : "Add to favorites")
            }
        }
        .navigationTitle(country.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FavoritesView: View {
    @Binding var countries: [Country]
    let columns = [
        GridItem(.flexible()),  
        GridItem(.flexible())
    ]
    
    var body: some View {
        Text("Favorites")
    }
}

#Preview {
    ContentView()
}
