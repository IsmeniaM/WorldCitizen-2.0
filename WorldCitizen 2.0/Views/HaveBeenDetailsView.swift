//
//  HaveBeenDetailsView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI

struct HaveBeenDetailsView: View {
    
    var haveBeen: HaveBeen
    
    var body: some View {
        Form {
        Section(header: Text("Country")) {
            Text(haveBeen.title)
            Text(haveBeen.description)
        }
            Section(header: Text("Year")) {
                Text(haveBeen.year)
            }
        }
        .navigationBarTitle(haveBeen.title)
    }
}

struct HaveBeenDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let haveBeen = HaveBeen(title: "Name of the country", description: "What was especial there", year: "2000")
        return
        NavigationView {
        HaveBeenDetailsView(haveBeen: haveBeen)
        }
    }
}
