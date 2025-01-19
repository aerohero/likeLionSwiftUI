//
//  ContentView.swift
//  DKToDo
//
//  Created by Sean on 1/17/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var todo: String = ""
    @State var dueDate: Date = Date()
    @State var isCompleted: Bool = false
//    @State var newtodo: Todo
//    @State var priority: [String] = ["High", "Medium", "Low"]
//    @State var category: [String] = ["Work", "Home", "Shopping"]
    
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [Todo]
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Write here your task to do", text: $todo)
                DatePicker("Due Date:", selection: $dueDate, displayedComponents: [.date])
                Text("LIST")
                    .font(.title3)
                    .fontWeight(.black)
                    .padding()
            }
            .font(.title2)
            .padding(20)
            .frame(maxWidth: .infinity)
            
            List {
                ForEach(todos) { task in
                    HStack {
                        Text(task.todo ?? "Not Found")
                        Spacer()
                        Text("\(task.dueDate, format: Date.FormatStyle(date: .numeric))")
                    }
                }
                .onDelete(perform: deleteTodo)
            }
            .navigationTitle(Text("To Do"))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: addTodo) {
                        Label("Add to do", systemImage: "plus")
                    }
                }
            }
        }
        Spacer()
        NavigationLink(destination: SearchView(todo: todo)) {
            Text("Search")
        }
    }
    
    private func addTodo() {
        withAnimation {
            let newTodo = Todo(todo: todo, dueDate: dueDate)
            modelContext.insert(newTodo)
        }
    }
    
    private func deleteTodo(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todos[index])
            }
        }
    }
    
    //    private func moveTodo(from source: IndexSet, to destination: Int) {
    //        todos.move(fromOffsets: source, toOffset: destination)
    //    }
}

#Preview {
    ContentView()
        .modelContainer(for: Todo.self, inMemory: true)
}
