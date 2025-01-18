//
//  Todo.swift
//  DKToDo
//
//  Created by Sean on 1/17/25.
//

import Foundation
import SwiftData

@Model
final class Todo {
    var todo: String?
    var dueDate: Date
    
    init(todo: String, dueDate: Date) {
        self.todo = todo
        self.dueDate = dueDate
    }
}
