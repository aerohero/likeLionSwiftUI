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
        TabView {
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
                        // enum 타입에 CaseIterable 프로토콜을 사용하면, 반복문에 allCases 프로퍼티를 사용할 수 있다.
                        ForEach(Priority.allCases, id: \.self) { priority in
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
                    TodoListView(searchText: searchText, priorityFilter: priorityFilter) // view call
                        .searchable(text: $searchText, prompt: "할 일 검색")
                        .navigationTitle("Todo List")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
//                                EditButton() // DK 어짜피 리스트 편집은 여기서 사용하지 않게 되므로 카테고리 편집 기능으로 변경
                                NavigationLink { CategoryListView()
                                } label: {
                                    Image(systemName: "gearshape.fill")
                                }
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
            .tabItem {
                Label("List", systemImage: "list.bullet")
            }
            CalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "Calendar")
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
