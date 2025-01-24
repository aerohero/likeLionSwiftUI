//
//  WorkTimerView.swift
//  TimerDemo
//
//  Created by Sean on 1/24/25.
//

import SwiftUI

struct WorkTimerView: View {
    
    @State private var workTimeRemaining: Int = 60 // 초 단위
    @State private var workIsRunning: Bool = false
                
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(String(format: "%02d", workTimeRemaining / 60)): \(String(format: "%02d", workTimeRemaining % 60))")
            // %d = 숫자를 "" 안에서 표현되도록 하는 문법
                .font(.system(size: 50, weight: .bold))
//                .onTapGesture {
//                    // timer 숫자를 탭 했을 때, 1분 > 5분 > 10분 순으로 타이머 설정을 변경하는 코드
//                    if timeRemaining < 60 {
//                        timeRemaining = 60
//                    } else if timeRemaining < 300 {
//                        timeRemaining = 300
//                    } else if timeRemaining < 600 {
//                        timeRemaining = 600
//                    } else {
//                        timeRemaining = 60
//                    }
//                }
            
            HStack {
                Button(action: {
                    workIsRunning.toggle()
                }, label: {
                    Image(systemName: workIsRunning ? "pause.fill" : "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding()
                })
                Button(action: {
                    workTimeRemaining = 3
                }, label: {
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding()
                })
            }
        }
        .padding()
        .onReceive(timer) { _ in
            if workIsRunning && workTimeRemaining > 0 {
                workTimeRemaining -= 1
            } else {
                workIsRunning = false
            }
        }
    }
}

#Preview {
    WorkTimerView()
}
