import UIKit

var num1: Int = .random(in: 0...10)
var num2: Int = .random(in: 0...10)
var resultNumberRandom: Int = .random(in: 0...100)

func quiz(num1: Int, num2: Int) -> String {
    var quizRandom: String = "\(num1) X \(num2) = \(resultNumberRandom)"
    var quizCorrect: String = "\(num1) X \(num2) = \(num1*num2)"
    var quizArray: [String] = [quizRandom, quizCorrect]
    var quizReturn = quizArray.randomElement()
    
    return quizReturn
}

