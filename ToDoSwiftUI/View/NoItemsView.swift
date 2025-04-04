//
//  NoItemsView.swift
//  ToDoSwiftUI
//
//  Created by kamila on 05.04.2025.
//

import SwiftUI

struct NoItemsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items")
                    .font(.headline)
                    .foregroundStyle(.red.gradient)
                    .fontWeight(.semibold)
                
                NavigationLink("Add a view", destination: AddView())
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
    }
}
