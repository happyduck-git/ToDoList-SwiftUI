//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by HappyDuck on 9/28/23.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var vm: ToDoListItemViewViewModel
    let item: ToDoListItem
    
    //MARK: - Init
    init(vm: ToDoListItemViewViewModel, item: ToDoListItem) {
        self._vm = StateObject(wrappedValue: vm)
        self.item = item
    }
    
    //MARK: - View
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title3)
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                self.vm.toggleIsDone(item: self.item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ToDoListItemView(vm: ToDoListItemViewViewModel(),
                     item: .init(id: "1123",
                                 title: "Get milk",
                                 dueDate: Date().timeIntervalSince1970,
                                 createdDate: Date().timeIntervalSince1970,
                                 isDone: true))
}
