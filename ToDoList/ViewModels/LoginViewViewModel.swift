//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject { //ViewModel을 ObservableObject로 설정
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    
    init() {}
    
}

extension LoginViewViewModel {
    func login() {
        guard self.validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool {
        errorMessage = nil
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid eamil."
            return false
        }
        
        return true
    }
}
