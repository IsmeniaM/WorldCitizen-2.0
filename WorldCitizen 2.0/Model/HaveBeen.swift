//
//  HaveBeen.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import Foundation
import FirebaseFirestoreSwift

struct HaveBeen: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var description: String
    var year: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case year
    }
}
