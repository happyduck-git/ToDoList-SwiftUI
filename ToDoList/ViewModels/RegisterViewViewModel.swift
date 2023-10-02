//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Task {
            do {
                let result = try await Auth.auth().createUser(withEmail: email, password: password)
                try await self.insertUserRecord(id: result.user.uid)
            }
            catch {
                TLLogger.logger.error("Error creating an user -- \(String(describing: error))")
            }
            
        }
        
    }
    
    private func insertUserRecord(id: String) async throws {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        try await db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
    
}
