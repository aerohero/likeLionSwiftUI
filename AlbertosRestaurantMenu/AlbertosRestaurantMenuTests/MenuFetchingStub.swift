//
//  MenuFetchingStub.swift
//  AlbertosRestaurantMenuTests
//
//  Created by sean on 4/16/25.
//

import Foundation
import Combine
@testable import AlbertosRestaurantMenu

class MenuFetchingStub: MenuFetching {
  let result: Result<[MenuItem], Error>
  
  init(returning result: Result<[MenuItem], Error>) {
    self.result = result
  }
  
  func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
    return Future { $0(self.result) }
      .delay(for: 0.1, scheduler: RunLoop.main)
      .eraseToAnyPublisher()
  }
}
