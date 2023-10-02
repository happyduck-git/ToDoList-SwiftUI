//
//  LoginView.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import SwiftUI

struct LoginView: View {

    @StateObject var vm: LoginViewViewModel
    
    var body: some View {
        NavigationStack {
            // Header
            HeaderView(title: "To Do List",
                       subtitle: "Get things done",
                       angle: 15,
                       background: .pink)
            
            // Login Form
            Form(content: {
                if let message = vm.errorMessage {
                    Text(message)
                        .foregroundStyle(.red)
                }
                
                TextField("Email Address", text: $vm.email)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $vm.password)
                    .textFieldStyle(.roundedBorder)
                
                TLButton(title: "Log in") {
                    vm.login()
                    
                }
                
            })
            .offset(y: -50)
            
            // Create Account
            VStack {
                Text("New aroung here?")
                NavigationLink("Create An Account") {
                    RegisterView()
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 150)
            
            Spacer()
        }
        
    }
    
    
}

#Preview {
    LoginView(vm: LoginViewViewModel())
}
