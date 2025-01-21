//
//  PriorityBadge.swift
//  TodoDemo
//
//  Created by Sean on 1/21/25.
//

import SwiftUI

struct PriorityBadge: View {
    let priority: Priority
    
    var body: some View {
        Text(priority.title)
            .font(.caption)
            .padding(4)
            .background(backgroundColor)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 4))
    }
    
    private var backgroundColor: Color {
        switch priority {
        case .high:
            return .red
        case .medium:
            return .yellow
        case .low:
            return .green
        }
    }
}

#Preview {
    PriorityBadge(priority: TodoItem(title: "Hello, world!").priority)
}
