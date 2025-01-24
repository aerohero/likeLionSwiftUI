//
//  ContentView.swift
//  TimerDemo
//
//  Created by Sean on 1/24/25.
//

import SwiftUI
//import AppKit

struct ContentView: View {
    
    @State var timeRemaining: Double = 60 // 초 단위
    @State private var isRunning: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var progress: Double = 0.0
    
    private func formatTime(_ time: Double) -> String {
            let minutes = Int(time / 60)
            let seconds = Int(time.truncatingRemainder(dividingBy: 60))
            return String(format: "%02d:%02d", minutes, seconds)
        }
    
    var body: some View {
        VStack() {
            ZStack {
                MyProgressbarView(timeRemaining: $timeRemaining)
                
                // 시간 텍스트
                Text(formatTime(timeRemaining))
                    .font(.system(size: 50, weight: .bold))
            }
            HStack {
                Button(action: {
                    isRunning.toggle()
                    withAnimation {
                        progress = 1.0
                    }
                }, label: {
                    Image(systemName: isRunning ? "pause.fill" : "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding()
                })
                Button(action: {
                    timeRemaining = 3 // 리셋 타임으로 다시 돌려놓는 코드가 필요하다.
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
        .background()
        .onReceive(timer) { _ in
            if isRunning && timeRemaining > 0 {
                timeRemaining -= 1
//                progress = timeRemaining*    % 로 아웃풋이 progress에 대입되어야
//            } else if timeRemaining == 0 {
//                isRunning = false
            } else {
                isRunning = false
//                NSSound.beep() // timer가 정지해 있으면 무조건 beep가 울리므로 지속시간을 30초로 두던가, 버튼으로 알람을 정지시킬 필요가 있다.
                
            }
        }
    }
}



#Preview {
    ContentView()
}


//            Text("\(String(format: "%02d", timeRemaining / 60)): \(String(format: "%02d", timeRemaining % 60))")
// %d = 숫자를 "" 안에서 표현되도록 하는 문법
//              .font(.system(size: 50, weight: .bold))
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
//            }



//    @Binding var progress: Double
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .leading) {
//                Rectangle()
//                    .fill(Color.gray.opacity(0.3))
//                    .cornerRadius(10)
//                Rectangle()
//                    .fill(Color.blue)
//                    .frame(width: geometry.size.width*progress)
//                    .cornerRadius(10)
//            }
//        }
//    }
//}
