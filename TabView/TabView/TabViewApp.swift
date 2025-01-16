//
//  TabViewApp.swift
//  TabView
//
//  Created by Sean on 1/13/25.
//

import SwiftUI

@main
struct TabViewApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase, initial: true) {
            switch scenePhase {
            case .active:
                print("Active")
            case .inactive:
                print("Inactive")
            case .background:
                print("Background")
            default:
                print("Unknown")
            }
        }
    }
}
