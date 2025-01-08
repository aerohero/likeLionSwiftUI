//
//  Generics.swift
//  
//
//  Created by Sean on 1/3/25.
//


import Foundation

class RecentList<T> {
    var slot1: T?
    var slot2: T?
    var slot3: T?
    var slot4: T?
    var slot5: T?

    func add(recent: T) {
        // 각 슬롯을 1칸씩 아래로
        slot5 = slot4
        slot4 = slot3
        slot3 = slot2
        slot2 = slot1
        slot1 = recent
    }

    func getAll() -> [T] {
        var recent = [T]()
        if let slot1 = slot1 { recent.append(slot1) }
        if let slot2 = slot2 { recent.append(slot2) }
        if let slot3 = slot3 { recent.append(slot3) }
        if let slot4 = slot4 { recent.append(slot4) }
        if let slot5 = slot5 { recent.append(slot5) }
        return recent
    }
}

let recentlyCopiedList = RecentList<Int>()
recentlyCopiedList.add(recent: 1)
recentlyCopiedList.add(recent: 2)
recentlyCopiedList.add(recent: 3)

var recentlyCopied = recentlyCopiedList.getAll()
print(recentlyCopied) // Last, Next, First

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
let rod = Person(name: "Rod")
let john = Person(name: "John")
let freddy = Person(name: "Freddy")
let recentlyVisitedList = RecentList<Person>()
recentlyVisitedList.add(recent: rod)
recentlyVisitedList.add(recent: john)
recentlyVisitedList.add(recent: freddy)
var recentlyVisited = recentlyVisitedList.getAll()
for person in recentlyVisited {
    print(person.name)
}

func makeDuplicates<T,Key: Hashable>(of item: T, withKeys keys: Set<Key>) -> [Key: T] {
    var duplicates: [Key: T] = [:]
    
    for key in keys {
        duplicates[key] = item
    }
    
    return duplicates
}
let awards: Set<String> = ["Best Visual Effects",
                           "Best Cinematography",
                           "Best Original Score",
                           "Best Film Editing"]
let oscars2022 = makeDuplicates(of: "Dune", withKeys: awards)
print(oscars2022["Best Visual Effects"] ?? "")



// 프로토콜과 제네릭/

import CoreLocation

protocol TransportLocation {
    var location: CLLocation { get }
}
protocol TransportMethod {
    associatedtype CollectionPoint: TransportLocation
    
    var defaultCollectionPoint: CollectionPoint { get }
    var averageSpeedInKPH: Double { get }
}
enum TrainStation: String, TransportLocation {
    case BMS = "Bromley South"
    case VIC = "London Victoria"
    case RAI = "Rainhan (Kent)"
    case BTN = "Brighton (East Sussex)"
    
    var location: CLLocation {
        return CLLocation()
    }
}
struct Train: TransportMethod {
    typealias CollectionPoint = TrainStation
    
    var defaultCollectionPoint: CollectionPoint {
        return TrainStation.BMS
    }
    var averageSpeedInKPH: Double { 100 }
}





























































































































































































































































































































































































