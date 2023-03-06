//
//  Database.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import Foundation

final class Database{
    private let FAV_KEY = "fav_key"
    
    func save(items: Set<Int>) {
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
    
    func load() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
        return Set(array)
    }
}
