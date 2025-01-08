//
//  ForWhile.swift
//  
//
//  Created by Sean on 1/2/25.
//

// For Loop
let ledZeppelin = ["Robert", "Jimmy", "John", "John Paul"]
for musician in ledZeppelin {
    print(musician)
}
for value in 1...12 {
    print("5 x \(value) = \(value * 5)")
}
let zeppelinByInstrument = ["vocals": "Robert",
                            "lead guitar": "Jimmy",
                            "drums": "John",
                            "bass guitar": "John Paul"]
for (key, value) in zeppelinByInstrument {
    print("\(value)가 \(key)를 연주합니다.")
}
//ledZeppelin.forEach { musician in print(musician) }
ledZeppelin.forEach { print($0) }
zeppelinByInstrument.forEach { (key, value) in print("\(value)가 \(key)를 연주합니다.") }

// While Loop
enum CoinFlip: Int {
    case heads
    case tails
    
    static func flipCoin() -> CoinFlip {
        return CoinFlip(rawValue: Int.random(in: 0...1))!
    }
}
func howManyHeadsInARow() -> Int {
    var numberOfHeadsInARow = 0
    var currentFlip: CoinFlip = CoinFlip.flipCoin()
    print("currentFlip.rawValue: \(currentFlip.rawValue)")
    while currentFlip == .heads {
        numberOfHeadsInARow += 1
        currentFlip = CoinFlip.flipCoin()
    }
    
    return numberOfHeadsInARow
}
let noOfHeads = howManyHeadsInARow()
print(noOfHeads)
