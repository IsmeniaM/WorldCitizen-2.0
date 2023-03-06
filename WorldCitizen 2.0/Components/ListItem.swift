//
//  ListItem.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI

struct ListItem: View {
    
    var country: Country = countries[0]
    
    var body: some View {
        HStack (alignment: .top) {
            Image (country.flag)
            Text (country.countryName)
        }
        .padding(.vertical)
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem()
    }
}
