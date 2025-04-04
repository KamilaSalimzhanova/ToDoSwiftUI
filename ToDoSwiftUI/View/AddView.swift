//
//  AddView.swift
//  ToDoSwiftUI
//
//  Created by kamila on 05.04.2025.
//

import SwiftUI

struct AddView: View {
    @State var textField: String = ""
    var body: some View {
        ScrollView {
            TextField("Type something here...", text: $textField)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            Button {
                Text("")
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: 100)
                    .background(.black)
                    .cornerRadius(10)
                    .padding()
            }

        }
        .navigationTitle("Add an item ✍🏻")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
