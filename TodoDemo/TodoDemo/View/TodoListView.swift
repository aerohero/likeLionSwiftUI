//
//  TodoListView.swift
//  TodoDemo
//
//  Created by Sean on 1/20/25.
//

import SwiftUI
import SwiftData

enum TodoNavigation: Hashable {
    case detail(TodoItem)
    case edit(TodoItem)
}

struct TodoListView: View {
    @Environment(\EnvironmentValues.modelContext) private var modelContext // EnvironmentValues 생략 가능 (일반적으로 생략해서 사용)
    
    @Query private var todos: [TodoItem]
    
    let searchText: String
    let priorityFilter: Priority?
    
    init(searchText: String = "", priorityFilter: Priority? = nil) {
        self.searchText = searchText
        self.priorityFilter = priorityFilter
        
        let predicate = #Predicate<TodoItem> { todo in
            searchText.isEmpty ? true : todo.title.contains(searchText) == true
        } // predicate는 검색조건 관련
        
        _todos = Query(filter: predicate, sort: [SortDescriptor(\TodoItem.createdAt)])
    }
    
    var filteredTodos: [TodoItem] {
        if let priority = priorityFilter {
            return todos.filter { $0.priority == priority }
        }
        return todos
    }
    
    // View
    var body: some View {
        List {
            ForEach(filteredTodos) { item in
                TodoRowView(todo: item) // view call
            }
            .onDelete(perform: deleteItems) // 아래 deleteItem 함수 선언되어 있다.
        }
        .navigationDestination(for: TodoNavigation.self) { navigation in
            switch navigation {
            case .detail(let item):
                TodoDetailView(item: item) // view call
                // DK TodoRowView가 있는데, 굳이 TodoDetailView를 만든 이유가 있는지?
            case .edit(let item):
                EditTodoView(todo: item) // view call
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) { // .OnDelete 때문에 선언되어야. offsets 의미 모르겠다.
        withAnimation {
            for index in offsets { // offsets가 왜 사용되는지 모르겠다.
                modelContext.delete(todos[index]) // modelContext가 왜 사용되는지 모르겠다.
            }
        }
    }
}

#Preview {
    TodoListView()
        .modelContainer(PreviewContainer.shared.container)
}
