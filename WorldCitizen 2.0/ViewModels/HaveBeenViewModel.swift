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
    
    init (haveBeen: HaveBeen = HaveBeen(title: "", description: "", year: "")) {
        self.haveBeen = haveBeen
        
        self.$haveBeen
            .dropFirst()
            .sink { [weak self] haveBeen in
                self?.modified = true
            }
            .store(in: &self.cancellables)
    }
    
    //Firestore
    
    private var db = Firestore.firestore()
    
    private func addCountry(_ haveBeen: HaveBeen) {
        do {
            let _ = try db.collection("havebeenList").addDocument(from: haveBeen)
        }
        catch {
            print(error)
        }
    }
    
    private func updateCountry(_ haveBeen: HaveBeen) {
        if let documentId = haveBeen.id {
            do {
                try db.collection("havebeenList").document(documentId).setData(from: haveBeen)
            }
            catch {
                print(error)
            }
        }
    }
    

private func updateOrAddCountry(_ haveBeen: HaveBeen) {
    if let _ = haveBeen.id {
        self.updateCountry(self.haveBeen)
    }
    else {
        addCountry(haveBeen)
    }
}


private func removeCountry(_ haveBeen: HaveBeen) {
    if let documentId = haveBeen.id {
        db.collection("havebeenList").document(documentId).delete { error in
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }
}

//UI handlers

func handleDoneTapped() {
    self.updateOrAddCountry(haveBeen)
}

func handleDeleteTapped() {
    self.removeCountry(haveBeen)
}

}

