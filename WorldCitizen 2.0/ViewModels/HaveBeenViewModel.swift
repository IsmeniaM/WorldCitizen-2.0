//
//  HaveBeenViewModel.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import Foundation
import Combine
import FirebaseFirestore

class HaveBeenViewModel: ObservableObject {
    
    @Published var haveBeen: HaveBeen
    @Published var modified = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init( haveBeen: HaveBeen = HaveBeen(title: "", description: "", year: "")) {
        self.haveBeen = haveBeen
        
        self.$haveBeen
            .dropFirst()
            .sink { [weak self] haveBeen in
                self?.modified = true
            }
            .store(in: &self.cancellables)
    }
    
    //Firebase
    
    private var db = Firestore.firestore()
    
    private func addCountry(_ haveBeen: HaveBeen) {
        do {
            let _ = try db.collection("havebeenList").addDocument(from: haveBeen)
        }
        catch {
            print(error)
        }
    }
    
}
