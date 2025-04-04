//
//  AddView.swift
//  ToDoSwiftUI
//
//  Created by kamila on 05.04.2025.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var textField: String = ""
    @State private var showAlert: Bool = false
    var body: some View {
        ScrollView {
            TextField("Type something here...", text: $textField)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            Button {
                if textChecker() {
                    listViewModel.addItem(textField)
                    presentationMode.wrappedValue.dismiss()
                } else {
                    withAnimation {
                        showAlert.toggle()
                    }
                }
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: 100)
                    .background(textField.isEmpty ? .black.opacity(0.2) : .black)
                    .cornerRadius(10)
                    .padding()
            }
            .disabled(textField.isEmpty)

        }
        .navigationTitle("Add an item ✍🏻")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Alert title"), message: Text("Your title is less then 3 characters!!!"), dismissButton: .cancel())
        }
    }
    
    private func textChecker() -> Bool {
        textField.count < 3 ? false : true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView().environmentObject(ListViewModel())
        }
    }
}
