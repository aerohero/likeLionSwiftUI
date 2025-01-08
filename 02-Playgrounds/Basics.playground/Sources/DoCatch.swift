//
//  DoCatch.swift
//  
//
//  Created by Sean on 1/2/25.
//

enum MealState {
    case initial
    case buyIngredients
    case prepareIngredients
    case cook
    case plateUp
    case serve
}

enum MealError: Error {
    case canOnlyMoveToAppropriateState(from: MealState, to: MealState)
    case tooMuchSalt
    case wrongStateToAddSalt
}

class Meal {
    private(set) var state: MealState = .initial
    private(set) var saltAdded = 0
    
    func change(to newState: MealState) throws {
        switch (state, newState) {
        case (.initial, .buyIngredients),
            (.buyIngredients, .prepareIngredients),
            (.prepareIngredients, .cook),
            (.cook, .plateUp),
            (.plateUp, .serve):
            state = newState
        default:
            throw MealError.canOnlyMoveToAppropriateState(from: state, to: newState)
        }
    }
    
    func addSalt() throws {
            print("addSalt >> \(saltAdded) / \(state)")
            if saltAdded >= 5 {
                throw MealError.tooMuchSalt
            } else if .initial == state || .buyIngredients == state {
                throw MealError.wrongStateToAddSalt
            } else {
                saltAdded += 1
            }
        }
    
    func buyIngredients() throws {
        try change(to: .buyIngredients)
    }
    func prepareIngredients() throws {
        try change(to: .prepareIngredients)
    }
    func cook() throws {
        try change(to: .cook)
    }
    func plateUp() throws {
        try change(to: .plateUp)
    }
    func serve() throws {
        try change(to: .serve)
    }
}
let dinner = Meal()
do {
//    try dinner.change(to: .buyIngredients)
//    try dinner.change(to: .prepareIngredients)
//    try dinner.change(to: .cook)
//    try dinner.change(to: .plateUp)
//    try dinner.change(to: .serve)
    
    try dinner.addSalt()
    try dinner.prepareIngredients()
    try dinner.buyIngredients()
    try dinner.cook()
    try dinner.plateUp()
    try dinner.serve()
    
    print("저녁 식사가 준비되었습니다!")
    
} catch MealError.canOnlyMoveToAppropriateState(let from, let to) {
    print("\(from) -> \(to) 상태로 이동할 수 없습니다.")
} catch MealError.tooMuchSalt {
    print("짜다!")
} catch MealError.wrongStateToAddSalt {
    print("이 단계에서는 소금을 추가할 수 없습니다.")
}
