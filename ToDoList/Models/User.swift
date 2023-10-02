//
//  User.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
