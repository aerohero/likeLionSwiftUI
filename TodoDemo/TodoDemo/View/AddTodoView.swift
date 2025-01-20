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
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
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
                        let todo = TodoItem(title: title)
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
