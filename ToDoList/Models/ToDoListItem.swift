//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func toggleDone(_ state: Bool) {
        isDone = state
    }
}
