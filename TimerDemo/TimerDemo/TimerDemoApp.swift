//
//  TimerDemoApp.swift
//  TimerDemo
//
//  Created by Sean on 1/24/25.
//

import SwiftUI

@main
struct TimerDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    setWindowFloating() // toggle 등을 사용해 기능을 on/off 할 수 있도록 수정할 필요가 있다.
                }
        }
    }
    
    func setWindowFloating() {
        if let window = NSApplication.shared.windows.first {
            window.level = .floating
        }
    }
}
