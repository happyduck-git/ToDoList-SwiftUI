//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
