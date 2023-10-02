//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // 오늘 날짜 선택이 안될까봐 넣어둔 임시방편 로직. 좀 더 디테일한 로직 필요!
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            // 86400은 24시간을 초로 변경한 값.
            return false
        }
        
        return true
    }
    
    init() {}
}

extension NewItemViewViewModel {
    func save() {
        guard canSave else {
            return
        }
        
        // Get current user id
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let itemId = UUID().uuidString
        let newItem = ToDoListItem(id: itemId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemId)
            .setData(newItem.asDictionary())
    }
}
