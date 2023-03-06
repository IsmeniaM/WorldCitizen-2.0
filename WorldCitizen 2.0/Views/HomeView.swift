//
//  HomeView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI

struct HomeView: View {
    
    var item: Item = items[0]
    
    @State private var tripdate = Date()
   
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 16) {
                        ForEach(items) { item in
                            NavigationLink(destination: {
                                Group{
                                    switch item.type {
                                    case "calendar":
                                        CalendarView()
                                    case "pictures":
                                        myPicturesView()
                                    case "contacts":
                                      ContactsView()
                                    default: EmptyView()
                                    }
                                }
                        }) {
                            CardView(item: item)
                        }
                    
                       }
                    }
                    .padding()
                }
                .navigationTitle("Welcome, ")
                
                Text("MY NEXT BOCKED TRIP : ")
                    .font(.title3).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                ScrollView {
                    VStack {
                            DatePicker( "Next Flyt", selection: $tripdate)
                    }
                }
                .padding()
            }
        }
    }
}
