//
//  Models.swift
//  AlbertosRestaurantMenu
//
//  Created by sean on 4/15/25.
//

import Foundation

struct MenuItem: Identifiable, Equatable {
  let category: String
  let name: String
  var id: String {
    name
  }
  let spicy: Bool
  let price: Double
}

struct MenuSection: Identifiable, Equatable {
  let category: String
  let items: [MenuItem]
  var id: String {
    category
  }
}

// 전역 함수: 카테고리별로 메뉴아이템을 그룹핑하여 섹션에 분류 배치 시키기
// 전역 함수를
func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
  guard menu.isEmpty == false else { return [] }
  return Dictionary(grouping: menu, by: { $0.category })
    .map { category, items in
      MenuSection(category: category, items: items)
    }
    .sorted { $0.category > $1.category }
}

// 이 첫 번째 반복에서는 메뉴가 하드 코딩된 배열입니다.
let menu = [
  MenuItem(category: "starters", name: "Caprese Salad", spicy: false, price: 7.99),
  MenuItem(category: "starters", name: "Arancini Balls", spicy: true, price: 8.99),
  MenuItem(category: "pastas", name: "Penne all'Arrabbiata", spicy: true, price: 12.99),
  MenuItem(category: "pastas", name: "Spaghetti Carbonara", spicy: false, price: 13.99),
  MenuItem(category: "drinks", name: "Water", spicy: false, price: 1.99),
  MenuItem(category: "drinks", name: "Red Wine", spicy: false, price: 9.99),
  MenuItem(category: "desserts", name: "Tiramisù", spicy: false, price: 5.99),
  MenuItem(category: "desserts", name: "Crema Catalana", spicy: false, price: 6.99),
]
