//
//  ContentView.swift
//  OXQuizApp
//
//  Created by Sean on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var number1: Int = 4
    @State var number2: Int = 5
    @State var resultNumber: Int = 9
    
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    
    var body: some View {
        // UI 구성 및 로직
        VStack {
            Text("다음 수식은 맞을까요?")
                .font(.largeTitle)
                .padding(.top, 40)
            Spacer()
            
            Text("\(number1) X \(number2) = \(resultNumber)")
                .font(.largeTitle)
            Spacer()
            
            HStack (alignment: .center, spacing: 60) {
                HStack {
                    Button(action: {
                        selectCorrect()
                    }) {
                        Image(systemName: "checkmark.diamond.fill")
                        Text("맞음")
                    }
                    .font(.largeTitle)
                    .foregroundStyle(.green)
                }
                HStack {
                    Button(action: {
                        selectWrong()
                    }) {
                        Image(systemName: "xmark.diamond")
                        Text("틀림")
                    }
                    .font(.largeTitle)
                    .foregroundStyle(.red)
                }
            }
            
            Spacer()
            
            HStack (alignment: .center, spacing: 50) {
                Text("\(countCorrect)개 맞춤")
                Text("\(countWrong)개 틀림")
            }
            .font(.largeTitle)
            Spacer()
            
            Button(action: {
                reloadGame()
            }) {
                Text("카운트 초기화")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
            }
            .padding(.bottom, 20)
        }
    }
    
    // 게임 재시작 로직
    func reloadGame() {
        countCorrect = 0
        countWrong = 0
        newQuiz()
    }
    
    // 정답 선택 시 로직
    func selectCorrect() {
        if resultNumber == number1 * number2 {
            countCorrect += 1
        } else {
            countWrong += 1
        }
        newQuiz()
    }
    
    // 오답 선택 시 로직
    func selectWrong() {
        if resultNumber != number1 * number2 {
            countCorrect += 1
        } else {
            countWrong += 1
        }
        newQuiz()
    }
    
    // 퀴즈 교체 ⭐️안되서 강의보고 해결한 부분
    func newQuiz() {
        number1 = .random(in: 0...10)
        number2 = .random(in: 0...10)
        
        if Int.random(in: 0...1) == 0 {
            resultNumber = number1 * number2
        } else {
            resultNumber = number1 * number2 + Int.random(in: -1...8)
        }
    }
}

#Preview {
    ContentView()
}
