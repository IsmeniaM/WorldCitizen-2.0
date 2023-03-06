//
//  Data.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var image: String
    var description: String
    var type: String
}

var items = [
    Item(image: "Calendar", description: "Travel App",type: "calendar"),
    Item(image: "Pictures", description: "Travel App",type: "pictures"),
    Item(image: "Contacts", description: "Travel App", type: "contacts"),
    Item(image: "Group 1real", description: "Travel App", type:"group")
]
