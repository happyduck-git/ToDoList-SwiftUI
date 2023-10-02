//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        
        // User가 login || logout 시에 currentUserId property가 업데이트 되고,
        // 상태에 따라 view를 업데이트 해준다.
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let `self` = self else { return }
            
            DispatchQueue.main.async {
                self.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
