//
//  TodoRowView.swift
//  TodoDemo
//
//  Created by Sean on 1/20/25.
//

import SwiftUI

struct TodoRowView: View {
    let todo: TodoItem
    
    @State private var showingEditView: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
                    .foregroundStyle(todo.isCompleted ? .green : .gray)
            VStack(alignment: .leading) {
                Text(todo.title)
                    .strikethrough(todo.isCompleted) // 텍스트 취소선 기능
                Text(todo.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            PriorityBadge(priority: todo.priority)
        }
        .onTapGesture {
            todo.isCompleted.toggle()
        }
        .onLongPressGesture(minimumDuration: 0.5) {
            showingEditView = true // view call로 연결된다.
        }
        .swipeActions(edge: .leading) {
            NavigationLink(value: TodoNavigation.edit(todo)) {
                Text("Detail")
            }
            .tint(.blue)
        }
        .sheet(isPresented: $showingEditView) {
            // EditTodoView 안에서 빠진 NavigationStack을 추가함
            // (팝업일 경우 네비게이션 바 제목을 출력하려면, 독립적인 NavigationStack 따로 필요하다.)
            NavigationStack { // DK Nav. 이중사용 아닌가?
                EditTodoView(todo: todo) // view call
            }
        }
        
//        NavigationLink {
////        Text("(\(item.title) at \(item.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))")
//            TodoDetailView(item: item)
//        } label: {
//            Text("\(item.title) at \(item.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))")
//        }
//        .sheet(isPresented: $showingEditView) {
//            EditTodoView(todo: item)
//        }
    }
}

#Preview {
    NavigationStack {
        List {
            TodoRowView(todo: TodoItem(title: "Hello, world!"))
        }
        .navigationTitle("Todo List")
    }
    
}
