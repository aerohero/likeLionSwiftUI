//
//  MenuSection+Fixture.swift
//  AlbertosRestaurantMenuTests
//
//  Created by sean on 4/15/25.
//

@testable import AlbertosRestaurantMenu

extension MenuSection {
  static func fixture(
    category: String = "category",
    items: [MenuItem] = [
      .fixture(category: "category"),
      .fixture(category: "category"),
      .fixture(category: "category"),
    ]
  ) -> MenuSection {
    MenuSection(
      category: category,
      items: items
    )
  }
}
