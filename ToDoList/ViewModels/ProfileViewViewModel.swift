//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    
    @Published var user: User? = nil
    
    init() {}
    
}

extension ProfileViewViewModel {
    func logout() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("Error singing out.")
        }
    }
    
    func fetchUser() async throws {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        let data = try await db.collection("users")
            .document(userId)
            .getDocument()
            .data()
        
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self,
                  let data = data else { return }
            
            self.user = User(id: data["id"] as? String ?? "",
                             name: data["name"] as? String ?? "",
                             email: data["email"] as? String ?? "",
                             joined: data["joined"] as? TimeInterval ?? 0)
        }
    }
}
