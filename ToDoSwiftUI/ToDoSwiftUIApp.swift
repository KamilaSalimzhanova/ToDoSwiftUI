//
//  ToDoSwiftUIApp.swift
//  ToDoSwiftUI
//
//  Created by kamila on 05.04.2025.
//

import SwiftUI

@main
struct ToDoSwiftUIApp: App {
    @StateObject var lVM: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(ListViewModel())
        }
    }
}
