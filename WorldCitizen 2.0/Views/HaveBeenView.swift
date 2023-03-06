//
//  HaveBeenView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI


struct HaveBeenView: View {
    
    @StateObject var viewModel = HaveBeenViewModel()
    
    private var addButton: some View {
        Button(action: {}) {
            Image(systemName: "plus")
        }
    }
   
    
    var body: some View {
        NavigationView {
            
            List {
                
                Text("Where I have been")
                    
                   }
                }
             .navigationTitle("I Have Been...")
             .navigationBarItems(trailing: addButton)
            }
        }

    

struct HaveBeenView_Previews: PreviewProvider {
    static var previews: some View {
        HaveBeenView()
    }
  }
