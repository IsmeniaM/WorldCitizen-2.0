//
//  CountriesHaveBeenViewModel.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import Foundation
import Combine
import FirebaseFirestore

class CountriesHaveBeenViewModel: ObservableObject {
    @Published var countriesHaveBeen = [HaveBeen]()
    
    private var db = Firestore.firestore()
    private var listenerRegistration: ListenerRegistration?
    
    deinit {
        unsubscribe()
    }
    
    func unsubscribe() {
        if listenerRegistration != nil {
            listenerRegistration?.remove()
            listenerRegistration = nil
        }
    }
    
    func subscribe() {
        if listenerRegistration == nil {
            listenerRegistration = db.collection("havebeenList").addSnapshotListener{ (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.countriesHaveBeen = documents.compactMap { queryDocumentSnapshot in
                    try? queryDocumentSnapshot.data(as: HaveBeen.self)
                }
            }
        }
    }
    
    func removeCountries(atOffsets indexSet: IndexSet) {
        let countriesHaveBeen = indexSet.lazy.map { self.countriesHaveBeen[$0]}
        countriesHaveBeen.forEach { haveBeen in
            if let documentId = haveBeen.id {
                db.collection("havebeenList").document(documentId).delete { error in
                    if let error = error {
                        print("Unable to remove document: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
