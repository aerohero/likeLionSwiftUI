//
//  SearchView.swift
//  DKToDo
//
//  Created by Sean on 1/17/25.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    var todo: String
    
    @Environment(\.modelContext) private var modelContext
    @State private var matches: [Todo] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(matches) { task in
                    HStack {
                        Text(task.todo ?? "Not Found")
                    }}
            }
            .navigationTitle("Search Results")
        }
        .task {
            let descriptor = FetchDescriptor<Todo>(predicate: #Predicate<Todo> { task in
                task.todo?.contains(todo) ?? false
            })
            do {
                matches = try modelContext.fetch(descriptor)
            } catch {
                print("Error fetching products: \(error)")
                matches = []
            }
        }
    }
}
//
//#Preview {
//    SearchView()
//}
