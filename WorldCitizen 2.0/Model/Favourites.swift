//
//  Favourites.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import Foundation

struct FavCountry: Identifiable, Codable {
    var id: Int
    var title: String
    var description: String
    var isFaved: Bool


static var sampleCountries: [FavCountry] {
    var tempList = [FavCountry]()
    
    for i in 1...20 {
        let id = i
        let title = "Country"
        let description = "Europe"
        
        tempList.append(FavCountry(id: id, title: title, description: description, isFaved: false))
        
      }
    
      return tempList
    }
}
