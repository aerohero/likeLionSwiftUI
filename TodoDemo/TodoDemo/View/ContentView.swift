//
//  ContentView.swift
//  TodoDemo
//
//  Created by Sean on 1/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var todos: [TodoItem]
    
    @State private var showingAddTodo: Bool = false
    @State private var searchText = ""
    @State private var priorityFilter: Priority? = nil

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        priorityFilter = nil
                    } label: {
                        Text("전체")
                            .font(.caption)
                            .padding(4)
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(.rect(cornerRadius: 4))
                            .overlay {
                                if priorityFilter == nil {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.blue, lineWidth: 2)
                                }
                            }
                    }
                    ForEach([Priority.low, Priority.medium, Priority.high], id: \.self) { priority in
                        Button {
                            priorityFilter = priority
                        } label: {
                            PriorityBadge(priority: priority)
                        }
                        .overlay {
                            if priorityFilter == priority {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(.blue, lineWidth: 2)
                            }
                        }
                    }
                }
                TodoListView(searchText: searchText) // view call
                    .searchable(text: $searchText, prompt: "할 일 검색")
                    .navigationTitle("Todo List")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                        ToolbarItem {
                            Button(action: {
                                showingAddTodo = true
                            }) {
                                Label("Add Item", systemImage: "plus")
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $showingAddTodo) { // view call
            AddTodoView()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
        .modelContainer(PreviewContainer.shared.container)
}
