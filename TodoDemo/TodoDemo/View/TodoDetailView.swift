//
//  TodoDetailView.swift
//  TodoDemo
//
//  Created by Sean on 1/20/25.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var item: TodoItem
    
    @State private var showingEditView: Bool = false
    
    var body: some View {
//        NavigationStack {
            Text("\(item.title) at \(item.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Delete") {
                            // 삭제 가능
                            modelContext.delete(item)
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Edit") {
                            showingEditView = true // view call로 연결된다.
                        }
                    }
                }
                .navigationTitle(item.title)
                .sheet(isPresented: $showingEditView) {
                    EditTodoView(todo: item) // view call + DK modal이라서 그런지 EditTodoView의 버튼이 나타나지 않는 문제가 생긴다.
                }
//        } // NavigationStack
    }
}

#Preview {
    TodoDetailView(item: TodoItem(title: "Hello, world!"))
}
