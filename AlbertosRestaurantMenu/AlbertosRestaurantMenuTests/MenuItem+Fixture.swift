//
//  MenuItem+Fixture.swift
//  AlbertosRestaurantMenuTests
//
//  Created by sean on 4/15/25.
//

//import Foundation

@testable import AlbertosRestaurantMenu

extension MenuItem {
  static func fixture(
    category: String = "category",
    name: String = "name",
    spicy: Bool = false,
    price: Double = 0.0,
  ) -> MenuItem {
    MenuItem(
      category: category,
      name: name,
      spicy: spicy,
      price: price,
    )
  }
}
