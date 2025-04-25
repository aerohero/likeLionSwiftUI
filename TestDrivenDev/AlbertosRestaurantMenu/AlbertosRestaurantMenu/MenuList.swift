//
//  ContentView.swift
//  AlbertosRestaurantMenu
//
//  Created by sean on 4/15/25.
//

import SwiftUI
import Combine

struct MenuList: View {
  //  let sections: [MenuSection]
  @StateObject var viewModel: ViewModel
  // DK: 아래 extension으로 중첩 객체 구성했기 때문에 MenuList.ViewModel에서 MenuList. 생략된 것임
  
  var body: some View {
    List {
      switch viewModel.sections {
      case .success(let sections):
        ForEach(sections) { section in
          Section(header: Text(section.category)) {
            ForEach(section.items) { item in
              MenuRow(viewModel: .init(item: item))
            }
          }
        }
      case .failure(let error):
        Text("An error occurred:")
        Text(error.localizedDescription).italic()
        Button("Retry") {
          viewModel.retry()
        }
        .padding()
        .background(Color.blue)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
      }
    }
    .refreshable {
      viewModel.retry()
    }
    .navigationTitle("Alberto's 🇮🇹")
}
}

extension MenuList {
  //  struct ViewModel {
  //    let sections: [MenuSection]
  //
  //    init(menu: [MenuItem], menuGrouping: @escaping ([MenuItem]) -> [MenuSection]) {
  //      self.sections = menuGrouping(menu)
  //    }
  //  }
  //}
  class ViewModel: ObservableObject {
    @Published private(set) var sections: Result<[MenuSection], Error> = .success([])
    
    private let menuFetching: MenuFetching
    private let menuGrouping: ([MenuItem]) -> [MenuSection]
    
    var cancellables = Set<AnyCancellable>()
    
    init(menuFetching: MenuFetching,
         menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory) {
      self.menuFetching = menuFetching
      self.menuGrouping = menuGrouping
      fetchMenu()
    }
    
    func fetchMenu() {
      menuFetching
        .fetchMenu()
      // [중요] 전달 받은 [MenuItem] 시퀀스를 menuGrouping 함수에 전달하도록 수정
        .map(menuGrouping)
      // [중요] Result<[MenuSection], Error> 타입으로 변환
        .sink(
          receiveCompletion: { [weak self] completion in
            if case .failure(let error) = completion {
              self?.sections = .failure(error)
            }
          },
          receiveValue: { [weak self] value in
            self?.sections = .success(value)
          })
        .store(in: &cancellables)
    }
    
    func retry() {
      fetchMenu()
    }
  }
}

#Preview {
  NavigationStack {
    //    MenuList(sections: groupMenuByCategory(menu))
    //    MenuList(viewModel: .init(menu: menu,
    //                              menuGrouping: groupMenuByCategory))
    //    MenuList(viewModel: .init(menuFetching: MenuFetchingPlaceholder(),
    //                              menuGrouping: groupMenuByCategory))
    MenuList(viewModel: .init(menuFetching: MenuFetchingPlaceholder()))
  }
}
