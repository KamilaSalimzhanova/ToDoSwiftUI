//
//  ListView.swift
//  ToDoSwiftUI
//
//  Created by kamila on 05.04.2025.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listViewModel.items) { item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                listViewModel.updateItem(item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteRow)
                .onMove(perform: listViewModel.moveRow)
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
        ListView().environmentObject(ListViewModel())
    }
}
