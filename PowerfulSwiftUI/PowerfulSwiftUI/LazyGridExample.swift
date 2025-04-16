//
//  ContentView.swift
//  PowerfulSwiftUI
//
//  Created by Sean on 4/3/25.
//

import SwiftUI

struct LazyGridExample: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<50) { index in
                    Text("Item \(index)")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

#Preview {
  LazyGridExample()
}
