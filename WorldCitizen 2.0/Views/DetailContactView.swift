//
//  DetailContactView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI

struct DetailContactView: View {
    
    let contact: DataContact
    
    var body: some View {
        VStack {
            Image(contact.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:150, height: 150)
                .clipped()
                .cornerRadius(150)
                .shadow(radius: 3)
            Text(contact.name)
                .font(.title)
                .fontWeight(.medium)
            
            Form {
                
                Section {
                    
                    HStack {
                        Text("Phone")
                        Spacer()
                        Text(contact.phone)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(contact.email)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack{
                        Text("Adress")
                        Spacer()
                        Text(contact.adress)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    
                }
                
                Section {
                    Button (action: {
                        print ("Send a messege" )
                    }) {
                        Text("Send a Message")
                }
                    Button (action: {
                        print ("Call" )
                    }) {
                        Text("Call")
                    }
            }
        }
    }
}

struct DetailContactView_Previews: PreviewProvider {
    static var previews: some View {
        DetailContactView(contact: contacts[0])
    }
       
}
}
