//
//  ListView.swift
//  ToDoSwiftUI
//
//  Created by kamila on 05.04.2025.
//

import SwiftUI

struct ListView: View {
    @State private var items: [String] = ["this is the first title", "this is the second title", "this is the third title"]
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    ListRowView(title: item)
                }
            }
            .listStyle(.inset)
            .navigationTitle("To-do list")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add") {
                        AddView()
                    }
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
