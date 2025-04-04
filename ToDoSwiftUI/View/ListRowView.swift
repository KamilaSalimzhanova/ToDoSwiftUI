//
//  ListRowView.swift
//  ToDoSwiftUI
//
//  Created by kamila on 05.04.2025.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .black)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 5)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ListRowView(item: ItemModel(title: "this is the first title", isCompleted: false))
            ListRowView(item: ItemModel(title: "this is the second title", isCompleted: true))
        }
    }
}
