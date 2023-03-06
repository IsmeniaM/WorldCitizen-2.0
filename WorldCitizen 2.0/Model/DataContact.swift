//
//  DataContact.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import Foundation
import SwiftUI

struct DataContact : Identifiable {
    let imageName: String
    let name: String
    let phone: String
    let email: String
    let adress: String
    let id = UUID()
}

let contacts = [
    DataContact(imageName: "Natasha", name: "Natasha", phone: "46 87976678", email: "natasha@gmail.com", adress: "176 Flaming Road"),
    DataContact(imageName: "Jonas", name: "Jonas", phone: "46 87976678", email: "jonas@gmail.com", adress: "176 Crazy Road")
]
