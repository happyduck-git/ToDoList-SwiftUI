//
//  MainView.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewViewModel()
    
    var body: some View {
        if vm.isSignedIn,
           !vm.currentUserId.isEmpty {
            
            self.accountView

        } else {
            let vm = LoginViewViewModel()
            LoginView(vm: vm)
            
        }
        
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            let homeVM = ToDoListViewViewModel(userId: vm.currentUserId)
            ToDoListView(vm: homeVM)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView(vm: ProfileViewViewModel())
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }

}

#Preview {
    MainView()
}
