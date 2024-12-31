//
//  Enum.swift
//  
//
//  Created by Sean on 12/31/24.
//

import Foundation

enum CompassDirection {
    case north
    case south
    case east
    case west
}

let direction: CompassDirection = .east    // enum 이름을 생략 할 수 있다.
let otherDirection = CompassDirection.south

switch direction {
    case .north: print("북")
    case .south: print("남")
    case .east: print("동")
    case .west: print("서")
}


/// 열거형
/// - 대문자로 시작하는 것이 관례
/// - case 는 값
/// - 연관 값을 이용하면 추가정보를 저장할 수 있다.
/// - 열거 형 값을 원시타입(Int, Float, Bool, Double, String)의 값으로 지정할 수 있습니다.
/// - 원시타입 값 확인 방법: .rawValue
enum Planet: String {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    func surfaceGravity() -> Double {
        switch self {
        case .mercury: return 3.7
        case .venus: return 8.8
        case .earth: return 9.8
        case .mars: return 3.7
        case .jupiter: return 2.4
        case .saturn: return 1.0
        case .uranus: return 1.1
        case .neptune: return 1.1
        }
    }
}

let earth = Planet.earth
print(earth.surfaceGravity())
