
//let minInt8 = Int8.min
//let maxInt8 = Int8.max
//print(minInt8, maxInt8)
//
//let minUInt8 = UInt8.min
//let maxUInt8 = UInt8.max
//print(minUInt8, maxUInt8)
//
//let decimalInteger = 17
//let binaryInteger = 0b10111
//let octalInteger = 0o777 
//let hexInteger = 0xFF 
//
////let decimalInteger = 17
////let binaryInteger = 0b10111 // 2진수
////let octalInteger = 0o777 // 8진수 (2의 세제곱) => 0 또는 1 자리수가 세개 0b000 / 0b111
////let hexInteger = 0xFF // 16진수 >> 2진수 4개 1111 1111 1111 111
////print("decimalInteger: \(decimalInteger), binaryInteger: \(binaryInteger), octalInteger: \(octalInteger), hexInteger: \(hexInteger)")
////
////// 숫자 구분자 (Swift 5.1 이후)
////let largeNumber = 1_000_000_000
////print(largeNumber)
//
//// 부동소수점
//
//let pi = 3.14159265358979323846
//print(pi)
//let anotherPi: Double = 3 + 0.14159265358979323846
//print(anotherPi)
//// 지수 표기법
//let exponentTen = 1.25e2
//print("1.25e2 = \(exponentTen)")
//let exponentSixteen = 0xFp2
//print("0xFp2 = \(exponentSixteen)") // 15 * 2^2 = 60
//// Float와 Double 의 정밀도 비교
//let f1: Float = 1.0
//let f2: Float = 0.3
//let f3: Float = 0.7
//let f4: Float = f2 + f3
//let d1: Double = 1.0
//let d2: Double = 0.3
//let d3: Double = 0.7
//let d4: Double = d2 + d3
//print("Float: \(f1) - \(f2) = \(f1 - f4)")
//print("Double: \(d1) - \(d2) = \(d1 - d4)")

//let name = "Swift"
//let welcomeMessage = "Hello, \(name)!" // 인터폴레이션을 사용하지 않으면, 변수가 아니라 그냥 name 자체가 찍힐 것이다. 왜냐면 쌍따옴표는 쌍따옴표 안의 문자 자체를 저장하라는 의미이기 때문이다. 즉 쌍따옴표 안의 변수상수를 변수상수가 아니라 문자열 자체로 인식하게 되는 것이다. 그러므로 인터폴레이션이 필요한 것이다.
////print(welcomeMessage)
//print("Hellow", name)
//print(name)

//let helloWorld = ""



//let greeting = "Hello, World!"
//print(greeting)
//// 여러줄의 문자열
//let multipleLines = """
//동해물과 백두산이 마르고 닳도록 
//    하느님이 보우하사 우리나라 
//        만세
//"""
//print(multipleLines)
//// 문자열 보간
//let name = "Swift"
//let welcomeMessage = "Hello, \(name)!"
//print(welcomeMessage)

//let romeoAndJuliet = [
//    "Act 1 Scene 1: Verona, A public place",
//    "Act 1 Scene 2: Capulet's mansion",
//    "Act 1 Scene 3: A room in Capulet's mansion",
//    "Act 1 Scene 4: A street outside Capulet's mansion",
//    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
//    "Act 2 Scene 1: Outside Capulet's mansion",
//    "Act 2 Scene 2: Capulet's orchard",
//    "Act 2 Scene 3: Outside Friar Lawrence's cell",
//    "Act 2 Scene 4: A street in Verona",
//    "Act 2 Scene 5: Capulet's mansion",
//    "Act 2 Scene 6: Friar Lawrence's cell"
//]
//var act1SceneCount = 0
//for scene in romeoAndJuliet {
//    if scene.hasPrefix("Act 1") {
//        act1SceneCount += 1
//    }
//}
//print("There are \(act1SceneCount) scenes in Act 1.")


//var newLine = "\n" // newline 특수문자
//print(newLine)
//var backslash = "\\"
//print(backslash)
//
//let escapedString = "줄바꿈: \n, 캐리지 리턴 \r, 탭: \t, 역슬래시 \\, 따옴표 \", 작은따옴표 ', 유니코드: \u{FF}"
//print(escapedString)


// 옵셔널 타입
//var index: Int?
//index = 3
//var treeArray = ["Oak", "Apple", "Banana", "Birch"]
//if index != nil {
//    print(treeArray[index!]) // 강제 언래핑
//} else {
//    print("값이 할당되지 않았을때")
//}
//// if let index = index => 축약해서 사용 가능
//if let index {
//    // 이 중괄호 안에서는 옵셔널이 아닌 Int 타입으로 사용 가능
//    print(treeArray[index])
//}
//
//var optionalName1: String?
//var optionalName2: String?
//var optionalName3: String?
//optionalName1 = "Swift"
//optionalName2 = "Programming"
//optionalName3 = "Language"
//
//if let name1 = optionalName1,
//   let name2 = optionalName2,
//   let name3 = optionalName3 {
//    print("\(name1) \(name2) \(name3)")
//}

import UIKit

var myDictionary = Dictionary<String, Int>()
myDictionary["Swift"] = 100
myDictionary["Programming"] = 200
myDictionary["Language"] = 300

// 딕셔너리의 값 엑세스는 값이 없을 수 있기 때문에, 옵셔널타입으로 값을 전달
print(myDictionary["C++"] ?? 0) // 기본값
if let value = myDictionary["C++"] {
    print(value)
} else {
    print(0)
}

// 타입 캐스팅
let value = myDictionary["Swift"] as! Int
print(value)

// UIView -> UIControl -> UIButton 순으로 상속 관계
let myButton: UIButton = UIButton()
let myControl = myButton as UIControl // 타입 캐스팅 ( 업 캐스팅 )

// UIScrollView ->  UITextView
let myScrollView: UIScrollView = UIScrollView()
//let myTextView = myScrollView as! UITextView // 강제 타입 캐스팅 ( 다운 캐스팅 )


// 조건부 타입 캐스팅
if let myTextView = myScrollView as? UITextView {
    print(myTextView.text ?? "")
} else {
    print("UITextView 로 타입 캐스팅 하지 못했습니다.")
}

















