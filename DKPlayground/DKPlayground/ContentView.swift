//
//  ContentView.swift
//  DKPlayground
//
//  Created by Sean on 1/20/25.
//

import SwiftUI

struct ContentView: View {
    
    let items = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                NavigationLink(item, destination: DetailView(item: item))
            }
            .navigationTitle("Items")
        }
    }
}

struct DetailView: View {
    var item: String

    var body: some View {
        Text("Selected: \(item)")
            .navigationTitle(item)
    }
}

#Preview {
    ContentView()
}
