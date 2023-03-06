//
//  ContactsView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        
        NavigationView { // nav para cada contacto o que preciso de fazer no outro lado tbm
            List (contacts) { contact in
                NavigationLink(destination:DetailContactView(contact: contact)) {
                    ContactRow (contact: contact)
                }
            }
            .navigationBarTitle("Contacts")
        }
        .environment(\.colorScheme, .light)
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
            
    }
}

struct ContactRow: View {
    
    let contact: DataContact
    
    var body: some View {
        HStack {
            Image("Natasha")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:60, height: 60)
                .clipped()
                .cornerRadius(50)
            VStack(alignment: .leading) {
                Text("Natasha Green")
                    .font(.system(size:21, weight:.medium,design: .default))
                Text("+46 89784386")
                
            }
        }
    }
}
