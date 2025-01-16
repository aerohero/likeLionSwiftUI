//
//  ContentView.swift
//  TabView
//
//  Created by Sean on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World!")
        TabView {
            Tab("First", systemImage: "01.circle") {
                FirstTabView()
            }
            Tab("Second", systemImage: "02.circle") {
                SecondTabView()
            }
//            FirstTabView()
//                .tabItem {
//                    Image(systemName: "01.circle")
//                    Text("First")
//                }
//            SecondTabView()
//                .tabItem {
//                    Image(systemName: "02.circle")
//                    Text("Second")
//                }
        }
//        .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
