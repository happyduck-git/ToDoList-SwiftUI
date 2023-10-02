//
//  ToDoListView.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var vm: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]

    //MARK: - Init
    init(vm: ToDoListViewViewModel) {
        self._vm = StateObject(wrappedValue: vm)
        self._items = FirestoreQuery(collectionPath: "users/\(vm.userId)/todos")
    }
    
    //MARK: - View
    var body: some View {
        NavigationView {
            VStack(content: {
                List(items) { item in
                    ToDoListItemView(
                        vm: ToDoListItemViewViewModel(),
                        item: item)
                        .swipeActions {
                            Button("Delete") {
                                self.vm.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(.plain)
            })
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    vm.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.gray)
                }
            }
        }
        .sheet(isPresented: $vm.showingNewItemView, content: {
            let newItemVM = NewItemViewViewModel()
            NewItemView(vm: newItemVM,
                        newItemPresented: $vm.showingNewItemView)
        })
    }
    
}

#Preview {
    ToDoListView(vm: ToDoListViewViewModel(userId: "7COn22CAstTJgzZEVmMiSni3JpB3"))
}
