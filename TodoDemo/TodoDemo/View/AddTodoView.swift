//
//  AddTodoView.swift
//  TodoDemo
//
//  Created by Sean on 1/20/25.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.modelContext) private var modelContext // 데이터 저장소에 접근할 수 있는 환경변수
    @Environment(\.dismiss) private var dismiss // 나를 호출한 뷰에서 닫기 기능을 동작 시키는 환경변수(클로저)
    
    @State private var title: String = ""
    @State private var priority: Priority = .medium
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                    Picker("우선순위", selection: $priority) {
                        ForEach(Priority.allCases, id: \.self) { Priority in
                            Text(Priority.title)
                                .tag(priority)
                        }
                    }
                }
            }
            .navigationTitle("New Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let todo = TodoItem(title: title, priority: priority) // 변수를 선언하면서 새로운 값을 변수에 저장하는 코드
                        modelContext.insert(todo)
                        // 뷰 닫기와 동시에 모델 컨텍스트 저장이 호출된다.
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddTodoView()
}
