//
//  RegisterView.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var vm = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Start organizing todos",
                       angle: -15,
                       background: .orange)
            
            Form {
                TextField("Full Name", text: $vm.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                
                TextField("Email Address", text: $vm.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $vm.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Register",
                         backgroundColor: .green) {
                    
                    self.vm.register()
                }
            }
            .offset(y: -50)
            
             Spacer()
        }
        
        
    }
}

#Preview {
    RegisterView()
}
