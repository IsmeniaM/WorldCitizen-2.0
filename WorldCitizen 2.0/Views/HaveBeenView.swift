//
//  HaveBeenView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI


struct HaveBeenView: View {
    
   @StateObject var viewModel = CountriesHaveBeenViewModel()
    
    private var addButton: some View {
        Button(action: {}) {
            Image(systemName: "plus")
        }
    }
    
    private func haveBeenRowView( haveBeen: HaveBeen) -> some View {
        NavigationLink(destination: HaveBeenDetailsView(haveBeen: haveBeen)) {
            VStack(alignment: .leading) {
                Text(haveBeen.title)
                    .font(.headline)
                Text(haveBeen.year)
                    .font(.subheadline)
          }
        }
    }
   
    
    var body: some View {
        NavigationView {
            List {
                ForEach (viewModel.countriesHaveBeen) { haveBeen in
                    haveBeenRowView(haveBeen: haveBeen)
                }
            }
             .navigationBarTitle("I Have Been...")
             .navigationBarItems(trailing: addButton)
             .onAppear() {
                 print("HaveBeenList appears. Subscribing to data updates")
                 self.viewModel.subscribe()
             }
            }
        }
  }
    

struct HaveBeenView_Previews: PreviewProvider {
    static var previews: some View {
        HaveBeenView()
    }
  }
