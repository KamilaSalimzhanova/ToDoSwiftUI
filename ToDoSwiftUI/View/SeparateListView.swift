//
//  SeparateListView.swift
//  ToDoSwiftUI
//
//  Created by kamila on 05.04.2025.
//

import SwiftUI

struct SeparateListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
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
    }
}

struct SeparateListView_Previews: PreviewProvider {
    static var previews: some View {
        SeparateListView().environmentObject(ListViewModel())
    }
}
