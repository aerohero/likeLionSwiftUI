//
//  ContentView.swift
//  Gesture
//
//  Created by Sean on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
