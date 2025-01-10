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
            Spacer()
            
            Text("다음 수식은 맞을까요?")
                .font(.largeTitle)
            Spacer()
            
            Text(quiz)
//            Text("\(num1) X \(num2) = \(resultNumberRandom)")
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
            Spacer()
        }
    }
    
    // 게임 재시작 로직
    func reloadGame() {
        countCorrect = 0
        countWrong = 0
        quiz()
    }
    
    // 정답 선택 시 로직
    func selectCorrect() {
        if resultNumber == (number1 * number2) {
            countCorrect += 1
        } else {
            selectWrong()
        }
        quiz()
    }
    
    // 오답 선택 시 로직
    func selectWrong() {
        if resultNumber == (number1 * number2) {
            countCorrect += 1
        } else {
            countWrong += 1
        }
        quiz()
    }
    
    // 퀴즈 교체
//    func quiz(num1: Int, num2: Int) -> String {
//        var quizRandom: String = "\(num1) X \(num2) = \(resultNumberRandom)"
//        var quizCorrect: String = "\(num1) X \(num2) = \(num1*num2)"
//        var quizArray: [String] = [quizRandom, quizCorrect]
//        var quizReturn = quizArray.randomElement()
//        
//        return quizReturn
//    }
    
    func quiz() {
        number1 = .random(in: 0...10)
        number2 = .random(in: 0...10)
        resultNumber = .random(in: 0...100)
        
    }
}

#Preview {
    ContentView()
}
