//
//  WorldCitizen_2_0App.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct WorldCitizen_2_0App: App {
    
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
