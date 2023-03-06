//
//  ContentView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image (systemName: "globe.europe.africa.fill")
                    Text ("Home")
                }
            ListView()
                .tabItem {
                    Image (systemName: "list.bullet.circle")
                    Text ("Countries")
                }
            FavouritView()
                .tabItem {
                    Image (systemName: "heart.circle")
                    Text ("Favourites")
                }
            HaveBeenView()
                .tabItem {
                    Image (systemName: "airplane.departure")
                    Text ("Where I have been")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

