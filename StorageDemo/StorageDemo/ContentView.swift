//
//  ContentView.swift
//  StorageDemo
//
//  Created by Sean on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    // scene 관련 데이터를 저장하고 관리하는데 사용
//    @SceneStorage("city") var city: String = ""
//    @AppStorage("mystore") var mytext: String = ""
    
    var body: some View {
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorgae")
                }
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
}

#Preview {
    ContentView()
}
