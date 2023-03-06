//
//  Content-ViewModel.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import Foundation
import SwiftUI

extension FavouritView {
    class ViewModel: ObservableObject {
        @Published var countries = [FavCountry]()
        @Published var showingFavs = false
        @Published var savedCountries: Set<Int> = [1, 7]
        var filteredCountries: [FavCountry] {
            if showingFavs {
                return countries.filter {
                    savedCountries.contains($0.id)}
            } else {
                return countries
            }
        }
        private var db = Database()
        
        init() {
            //self.savedItems = db.load()
            self.countries = FavCountry.sampleCountries
          }
        
        func sortFavs() {
            withAnimation {
                showingFavs.toggle()
            }
        }
        
        func contains(_ country: FavCountry) -> Bool {
            savedCountries.contains(country.id)
        }
        
        func toggleFav(country: FavCountry){
            if contains(country) {
                savedCountries.remove(country.id)
            } else {
                savedCountries.insert(country.id)
            }
            db.save(items: savedCountries)
        }
       }
    }
