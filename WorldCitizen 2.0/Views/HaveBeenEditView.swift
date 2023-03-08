//
//  HaveBeenEditView.swift
//  WorldCitizen 2.0
//
//  Created by Ismenia Brandao on 2023-03-07.
//

import SwiftUI

enum Mode {
    case new
    case edit
}

enum Action {
    case delete
    case done
    case cancel
}

struct HaveBeenEditView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
    
    @ObservedObject var viewModel = HaveBeenViewModel()
    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    var cancelButton: some View {
        Button(action: {self.handleCancelTapped() }) {
            Text("Cancel")
        }
    }
    
    var saveButton: some View {
        Button(action: {self.handleDoneTapped() }) {
            Text(mode == .new ? "Done" : "Save")
        }
        .disabled(!viewModel.modified)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("I have Been")) {
                    TextField("Title", text: $viewModel.haveBeen.title)
                    TextField("Year", text: $viewModel.haveBeen.year)
                }
                
                Section(header: Text("Description")) {
                    TextField("Description", text: $viewModel.haveBeen.description)
                }
                
                if mode == .edit {
                    Section {
                        Button("Delete Country") { self.presentActionSheet.toggle() }
                        .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle(mode == .new ? "New Country" : viewModel.haveBeen.title)
            .navigationBarTitleDisplayMode(mode == .new ? .inline : .large)
            .navigationBarItems(leading: cancelButton, trailing: saveButton)
            .actionSheet(isPresented: $presentActionSheet) {
                ActionSheet (title: Text("Are you sure?"),
                buttons: [
                    .destructive(Text("Delete Country"),
                                 action: { self.handleDeleteTapped() }),
                    .cancel()
                ])
            }
        }
    }
    
    //Action Handlers
    
    func handleCancelTapped() {
        self.dismiss()
    }
    
    func handleDoneTapped() {
          self.viewModel.handleDoneTapped()
          self.dismiss()
        }
         
        func handleDeleteTapped() {
          viewModel.handleDeleteTapped()
          self.dismiss()
            self.completionHandler?(.success(.delete))
        }
         
        func dismiss() {
          self.presentationMode.wrappedValue.dismiss()
        }
}

struct HaveBeenEditView_Previews: PreviewProvider {
    static var previews: some View {
       let haveBeen = HaveBeen(title: "Country", description: "What was special", year: "2000")
        let haveBeenViewModel = HaveBeenViewModel(haveBeen: haveBeen)
        return HaveBeenEditView(viewModel: haveBeenViewModel, mode: .edit)
    }
}
