//
//  ContentView.swift
//  AlbertosRestaurantMenu
//
//  Created by sean on 4/15/25.
//

import SwiftUI

struct MenuList: View {
//  let sections: [MenuSection]
  let viewModel: ViewModel // DK: 아래 extension으로 중첩 객체 구성했기 때문에 MenuList.ViewModel에서 MenuList. 생략된 것임
  
  var body: some View {
    List {
      ForEach(viewModel.sections) { section in
        Section(header: Text(section.category)) {
          ForEach(section.items) { item in
            MenuRow(viewModel: .init(item: item))
          }
        }
      }
    }
    .navigationTitle("Alberto's 🇮🇹")
  }
}

extension MenuList {
  struct ViewModel {
    let sections: [MenuSection]
    
    init(menu: [MenuItem], menuGrouping: @escaping ([MenuItem]) -> [MenuSection]) {
      self.sections = menuGrouping(menu)
    }
  }
}


#Preview {
  NavigationStack {
//    MenuList(sections: groupMenuByCategory(menu))
    MenuList(viewModel: .init(menu: menu,
                                  menuGrouping: groupMenuByCategory))
  }
}
