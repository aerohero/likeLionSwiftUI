//
//  Closer.swift
//  
//
//  Created by Sean on 12/31/24.
//


/// 클로저
/// - {} 중괄호로 감싸져 있는 코드 블록
/// - 변수에 할당할 수 있다.
/// - 함수 파라미터로 사용할 수 있다.
/// - 클로저 타입을 추론할 수 있어, 생략할 수 있다.
/// - 함수의 마지막 인자가 클로저일 때, 후행 클로저로 더 읽기 쉽게 만든다.
/// - $(달러사인)과 순번(1,2,3,...)으로 파라미터의 이름(변수명)도 생략할 수 있다.
/// - 자신이 정의된 컨텍스트(중괄호 스코프)에서 상수와 변수를 캡처할 수 있다.
public func runclosure() {
    let simpleCloser = { print("Hello World") }

    simpleCloser()

    let multiply: (Int, Int) -> Int = { x, y in x * y }
    /* let multiply: (Int, Int) -> Int = { (x: Int, y: Int) -> Int in
     return x * y
     } */

    print(multiply(5, 6))

    func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
        return operation(a, b)
    }

    let addition: (Int, Int) -> Int = { x, y in x + y }

    let result = performOperation(5, 6, operation: multiply)
    print(result)

    // 인라인 함수


    // 후행 클로저
    let numbers = [1, 2, 3, 4, 5]
    let squaredNumbers = numbers.map { element in element * element }
    print(squaredNumbers)

    func makeIncrementer(incrementAmount: Int) -> () -> Int {
        var total = 0
        let incrementer: () -> Int = {
            total += incrementAmount
            return total
        }
        return incrementer
    }

    let incrementer = makeIncrementer(incrementAmount: 5)
    print(incrementer())
    print(incrementer())
    print(incrementer())

    let incrementer2 = makeIncrementer(incrementAmount: 50)
    print(incrementer2())
    print(incrementer2())

}
