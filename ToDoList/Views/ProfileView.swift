//
//  ProfileView.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var vm: ProfileViewViewModel
    
    //MARK: - Init
    init(vm: ProfileViewViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    //MARK: - View
    var body: some View {
        NavigationView {

            VStack(content: {
                if let user = self.vm.user {
                    self.profile(user: user)
                } else {
                 Text("Loading User Profile...")
                }
                
            })
            .navigationTitle("Profile")
        }
        .onAppear {
            Task {
                do {
                    try await self.vm.fetchUser()
                }
                catch {
                    print("Error fetching user info")
                }
            }
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        let imageHeight:CGFloat = 125.0
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: imageHeight, height: imageHeight)
            .padding()
        
        // Info: Name, Email, Member since
        VStack(alignment: .leading, content: {
            HStack {
                Text("Name: ")
                    .bold()
                
                Text(user.name)
            }
            
            HStack {
                Text("Email: ")
                    .bold()
                
                Text(user.email)
            }
            
            HStack {
                Text("Member Since: ")
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        })
        .padding()
        
        // Sign out
        Button("Log Out") {
            self.vm.logout()
        }
        .tint(.red)
        .padding()
    }
}

#Preview {
    ProfileView(vm: ProfileViewViewModel())
}
