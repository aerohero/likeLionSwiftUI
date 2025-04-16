//
//  AlbertosRestaurantMenuApp.swift
//  AlbertosRestaurantMenu
//
//  Created by sean on 4/15/25.
//

import SwiftUI

@main
struct AlbertosRestaurantMenuApp: App {
  var body: some Scene {
    WindowGroup {
      //            MenuList(sections: groupMenuByCategory(menu))
      NavigationStack {
        MenuList(viewModel: .init(
          menu: menu,
          menuGrouping: groupMenuByCategory
        ))
      }
    }
  }
}
