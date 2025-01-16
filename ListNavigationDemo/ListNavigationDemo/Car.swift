//
//  Car.swift
//  ListNavigationDemo
//
//  Created by Sean on 1/14/25.
//

import SwiftUI

struct Car: Codable, Identifiable, Hashable {
    var id: String
    var name: String
    var description: String
    var isHybrid: Bool
    var imageName: String
}
