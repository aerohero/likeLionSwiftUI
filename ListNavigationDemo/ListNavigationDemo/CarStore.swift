//
//  CarStore.swift
//  ListNavigationDemo
//
//  Created by Sean on 1/14/25.
//

import SwiftUI

// @Observable 매크로를 사용하여 상태 변화를 관찰 가능하게 만드는 클래스
@Observable
class CarStore {
    var cars: [Car]
    
    // 초기화 메서드
    // 기본값으로 빈 배열을 받음
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
