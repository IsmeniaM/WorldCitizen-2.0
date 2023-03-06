//
//  FavouritView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI
import Foundation

struct FavouritView: View {
    @StateObject private var vm = ViewModel()
    
    
    var body: some View {
        VStack {
            Button("Toggle Favourites", action: vm.sortFavs)
               .padding()

            List {
                ForEach(vm.filteredCountries) { country in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(country.title)
                                .font(.headline)
                            Text(country.description)
                                .font(.subheadline)
                        }
                        Spacer()
                        Image(systemName: vm.contains(country) ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .onTapGesture {
                                vm.toggleFav(country: country) //favCountry?
                            }
                    }

                }
            }
            .cornerRadius(10)
        }
    }
 }


struct FavouritView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritView()
    }
}
