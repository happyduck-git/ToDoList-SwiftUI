//
//  TLButton.swift
//  ToDoList
//
//  Created by HappyDuck on 9/29/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let textColor: Color
    
    let action: () -> Void
    
    init(title: String,
         backgroundColor: Color = .blue,
         textColor: Color = .white,
         action: @escaping () -> Void) {
        
        self.title = title
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.action = action
    }
    
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundStyle(backgroundColor)
                Text(title)
                    .foregroundStyle(textColor)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(title: "Button") {
        
    }
}
