//
//  DataCountries.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI

struct Country: Identifiable {
    var id = UUID()
    var flag : String
    var countryName : String
    
}

var countries = [
    
    Country(flag: "Albania", countryName: "Albania"),
    Country(flag: "Andorra", countryName: "Andorra"),
    Country(flag: "Austria", countryName: "Austria"),
    Country(flag: "Belarus", countryName: "Belarus"),
    Country(flag: "Belgium", countryName: "Belgium")
    
]
