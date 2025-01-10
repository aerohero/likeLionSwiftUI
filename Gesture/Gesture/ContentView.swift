//
//  ContentView.swift
//  Gesture
//
//  Created by Sean on 1/10/25.
//

import SwiftUI

//enum DurationError: Error {
//    case
//    case
//}
//
//struct ContentView: View {
//    @State private var isTapped = false
//    @State private var showAlert = false
//    
//    var body: some View {
////        Text("Tap Me!")
////            .font(.largeTitle)
////            .padding()
////            .background(isTapped ? Color.green : Color.red)
////        // Tap 카운트를 이용해 실행시킬 탭 횟수를 조절할 수 있다.
////            .onTapGesture(count: 1) {
////                isTapped.toggle()
////            }
////        Button("Show Alert") {
////            showAlert = true
////        }
////        // 경고창 팝업을 띄우는 수정자
////        .alert("Important Message",
////               isPresented: $showAlert,
////               actions: {
////            Button("OK", role: .cancel) { }
////        }, message: {
////            Text("This is an important message!")
////        })
//        Button(action: {
//            Task(priority: .high) {
//                await doSomething()
//            }
//            
//        }) {
//            Text("Do Something")
//        }
//    }
////    
////    func doSomething() async {
////        print("Start \(Date())")
//////        await takesTooLong()
//////        print("End \(Date())")
////        // 비동기 반환값을 위한 async let
////        async let result = takesTooLong()
////        print("After async-let \(Date())")
////        // async let 상수를 사용하려면, await
////        print("result \(await result)")
////        print("End \(Date())")
////    }
////    
////    func takesTooLong() async -> Date {
////        sleep(5)
////        print("Async task completed at \(Date())")
////        return Date()
////
//    func doSomething() async {
//        print("Start \(Date())")
//        do {
//            try await takesTooLong(delay: 6)
//        } catch Duration
//        print("End \(Date())")
//    }
//    
//    func takesTooLong(delay: UInt32) async throw {
//        if delay < 5 {
//            
//        }
//    }
//}

actor BuildMessage {
    var message: String = ""
    let greeting = "Hello"

    func setName(name: String) {
        self.message = "\(greeting) \(name)"
    }

    nonisolated func getGreeting() -> String {
        return greeting
    }
}

struct ContentView: View {
    var builder = BuildMessage()

    var body: some View {
        Text("Hello World!")
    }

    // 액터의 메서드를 호출하거나 프로퍼티에 접근할 때는 'await' 키워드를 사용해야 합니다.
    func someFunction() async {
        await builder.setName(name: "Jane Smith")
        let message = await builder.message
        print(message)
    }

    @MainActor
    func asyncFunction() async {
        await builder.setName(name: "Jane Smith")
        let greeting = builder.getGreeting()
        print(greeting)
    }

    func syncFunction() {
//        builder.setName(name: "Jane Smith") // swift 6 부터는 오류
        let greeting = builder.getGreeting()
        print(greeting)
    }
}

#Preview {
    ContentView()
}
