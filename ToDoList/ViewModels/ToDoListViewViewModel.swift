//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import Foundation
import FirebaseFirestore

/// ViewModel for list of items view
/// Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
}

extension ToDoListViewViewModel {
    
    /// Delete to do list item.
    /// - Parameter id: Item id to delete.
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(self.userId)
            .collection("todos")
            .document(id)
            .delete() // @FirestoreQuery를 사용하기 때문에 call back이나 async 사용하지 않아도 됨.
    }
}
