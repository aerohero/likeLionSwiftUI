//
//  Optional.swift
//  
//
//  Created by Sean on 12/31/24.
//

import Foundation

public func runOptional() {
    var dayOfTheWeek: String = "Monday"
    dayOfTheWeek = "Tuesday"
    print(dayOfTheWeek)
    dayOfTheWeek = "Wednesday"
    print(dayOfTheWeek)
    // dayOfTheWeek = nil 컴파일 시 오류 발생
    dayOfTheWeek = "" // 최소한 빈 문자열을 넣어야 한다.

    var numberOfFingersHeldUpByFinn: Int?
    numberOfFingersHeldUpByFinn = nil
    print(numberOfFingersHeldUpByFinn)
    print(numberOfFingersHeldUpByFinn ?? "모른다.")

    numberOfFingersHeldUpByFinn = 3
    print(numberOfFingersHeldUpByFinn)
    
    //print(numberOfFingersHeldUpByFinn != nil ? numberOfFingersHeldUpByFinn : "모른다.")

    print(numberOfFingersHeldUpByFinn ?? "모른다.")

    // 강제 언랩핑 unwrapping
    let lastNumberOfFingersHeldUpByFinn: Int = numberOfFingersHeldUpByFinn!
    print(lastNumberOfFingersHeldUpByFinn ?? "모른다.")

}


