//
//  ContentView.swift
//  ShortcutDemo
//
//  Created by Neil Smyth on 7/29/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            PurchaseView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Buy")
                }

            HistoryView()
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }
        }
    }
}

#Preview {
    ContentView()
}

// #Preview 생기기 전에는 struct 구조체를 만들어서 프리뷰를 만들었었다.
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
