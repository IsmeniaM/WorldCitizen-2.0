//
//  HaveBeenDetailsView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-06.
//

import SwiftUI

struct HaveBeenDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditHaveBeenSheet = false
    
    var haveBeen: HaveBeen
    
    private func editButton(action: @escaping () -> Void) -> some View {
        Button(action: { action() }) {
            Text("Edit")
        }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Country")) {
              Text(haveBeen.title)
              Text(haveBeen.description)
        }
            Section(header: Text("Year")) {
                Text(haveBeen.year)
            }
        }
        .navigationBarTitle(haveBeen.title)
        .navigationBarItems(trailing: editButton {
            self.presentEditHaveBeenSheet.toggle()
        })
        .onAppear() {
            print("HaveBeenDetailsView.onAppear() for \(self.haveBeen.title)")
        }
        .onDisappear() {
            print("HaveBeenDetailsView.onDisappear()")
        }
        .sheet(isPresented: self.$presentEditHaveBeenSheet) {
            HaveBeenEditView(viewModel: HaveBeenViewModel(haveBeen: haveBeen), mode: .edit) { result in
                if case .success(let action) = result, action == .delete {
                    self.presentationMode.wrappedValue.dismiss()
               }
                
            }
        }
    }
}

struct HaveBeenDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let haveBeen = HaveBeen(title: "Name of the country", description: "What was especial there", year: "2000")
        return
           NavigationView {
              HaveBeenDetailsView(haveBeen: haveBeen)
        }
    }
}
