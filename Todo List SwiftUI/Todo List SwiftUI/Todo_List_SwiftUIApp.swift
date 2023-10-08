//
//  Todo_List_SwiftUIApp.swift
//  Todo List SwiftUI
//
//  Created by Bola Gamal on 03/10/2023.
//

import SwiftUI

@main
struct Todo_List_SwiftUIApp: App {
    
    var body: some Scene {
        WindowGroup {
/// Fit Layout UI on IPad
            NavigationStack {
                ListView()
            }
/// OR
//            NavigationView(content: {
//                ListView()
//            })
//            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(ListViewModel())
        }
    }
}
