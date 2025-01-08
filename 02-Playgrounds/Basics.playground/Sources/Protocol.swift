//
//  Protocol.swift
//  
//
//  Created by Sean on 1/2/25.
//
import Foundation

protocol Describable {
    var description: String { get }
}

struct Person: Describable {
    let name: String
    let age: Int
    
    var description: String {
        return "Person: \(name), \(age)"
    }
}

let person = Person(name: "Jungman", age: 20)
print(person.description)

protocol Movable {
    func move(to point: CGPoint)
}

class Car: Movable {
    var postion: CGPoint = CGPoint(x: 0, y: 0)
    
    func move(to point: CGPoint) {
        postion = point
        print("Car moved to \(point)")
    }
}

let car = Car()
car.move(to: CGPoint(x: 10, y: 20))
print(car.postion)

protocol Named {
    init(name: String)
    
    func displayName() -> String
}

class Person2: Named {
    func displayName() -> String {
        return "Person2: \(name)"
    }
    
    let name: String
    
    required init(name: String) {
        self.name = name
    }
}

class Friend: Person2 {
    
    required init(name: String) {
        fatalError("init(name:) has not been implemented")
    }
        
    let age: Int
}

struct Point: Named {
    func displayName() -> String {
        return "Point: \(name)"
    }
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Named {
    func printDescription() {
        print(displayName())
    }
}

extension String {
    func makeUpperCase() -> String {
        return uppercased()
    }
}

let person3 = Person2(name: "Jungman")
person3.printDescription()
print("car".makeUpperCase())

/* ---------------------------
 ------------------------------*/
 
protocol Payable {
    func calculateWages() -> Double
}

protocol TimeOffRequestable {
    func requestTimeOff(days: Int) -> Bool
}

func processEmployee(employee: Payable & TimeOffRequestable) {
    let wages = employee.calculateWages()
    let timeOffRequested = employee.requestTimeOff(days: 10)
}
protocol Container {
    associatedtype Item
    mutating func add(_ item: Item)
    var count: Int { get }
}
struct IntStack: Container {
    typealias Item = Int
    private var items: [Int] = []
    
    mutating func add(_ item: Int) { items.append(item) }
    var count: Int { items.count }
}
protocol Describable {
    var description: String { get }
}
func printDecription<T: Describable>(_ item: T) {
    print(item.description)
}
protocol Runnable {
    func run()
}
protocol Swimmable {
    func swim()
}
protocol Flyable {
    func fly()
}
struct Bird: Flyable, Runnable {
    func fly() { print("Flying") }
    func run() { print("Running") }
}
struct Fish: Swimmable {
    func swim() { print("Swimming") }
}
struct Duck: Flyable, Runnable, Swimmable {
    func fly() { print("Flying") }
    func run() { print("Running") }
    func swim() { print("Swimming") }
}
let duck = Duck()
duck.fly()
duck.run()
duck.swim()


