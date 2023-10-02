//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// ViewModel for single to do list item view (each row in items list)
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
}

extension ToDoListItemViewViewModel {
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.toggleDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
