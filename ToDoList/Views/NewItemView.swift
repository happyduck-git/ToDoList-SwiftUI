//
//  NewItemView.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var vm: NewItemViewViewModel
    @Binding var newItemPresented: Bool // 부모 ViewModel의 present bool을 변경하여 줌으로써,
                                        // sheet를 dismiss 해준다.
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                TextField("Title", text: $vm.title)
                    .textFieldStyle(.plain)
                
                DatePicker("Due Date", selection: $vm.dueDate)
                    .datePickerStyle(.graphical)
                
                TLButton(title: "Save", backgroundColor: .pink) {
                    if vm.canSave {
                        vm.save()
                        self.newItemPresented = false
                    } else {
                        vm.showAlert = true
                        
                    }

                }
                
            }
            .alert(isPresented: $vm.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
    }
}

#Preview {
    NewItemView(vm: NewItemViewViewModel(),
                newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
