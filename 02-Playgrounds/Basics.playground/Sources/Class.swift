//
//  Class.swift
//  
//
//  Created by Sean on 12/31/24.
//


import Foundation

// runOptional()
// runFunction()

class Person {
    let givenName: String
    let middleName: String?
    let familyName: String
    var country: String = "KR"
    
    init (givenName: String, middleName: String? = nil, familyName: String) {
        self.givenName = givenName
        self.middleName = middleName
        self.familyName = familyName
    }
    
    var displayName: String {
        return "\(fullName()) - Location: \(country)"
    }
    
    func fullName() -> String {
        var fullName: String = ""
        if let middleName { fullName += middleName + " " }
        fullName += givenName + " " + familyName
        return fullName
    }
    
    static func createDummyPerson() -> Person {
        return Person(givenName: "John", familyName: "Doe")
    }
}

let person = Person.createDummyPerson()
print(person.fullName())

let person2 = Person(givenName: "Jane", familyName: "Trumph")
print(person2.fullName())
                     
let person3 = Person.createDummyPerson()
person3.country = "US"
print(person3.displayName)
