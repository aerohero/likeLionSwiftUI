//
//  TodoItem.swift
//  TodoDemo
//
//  Created by Sean on 1/20/25.
//

import Foundation
import SwiftData

@Model
final class TodoItem: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    var priority: Priority
    
    init(title: String, isCompleted: Bool = false, priority: Priority = Priority.medium, createdAt: Date = Date()) {
        self.title = title
        self.isCompleted = isCompleted
        self.priority = priority
        self.createdAt = createdAt
    }
    
    func hash(into hasher: inout Hasher) { // DK hashable protocol을 따르므로, 필수로 만들어줘야 하는 것
        hasher.combine(id) // DK?
    }
    
    static func == (lhs: TodoItem, rhs: TodoItem) -> Bool { // DK?
        lhs.id == rhs.id
    }
}
