//
//  MenuFetching.swift
//  AlbertosRestaurantMenu
//
//  Created by sean on 4/16/25.
//

import Combine

protocol MenuFetching {
  func fetchMenu() -> AnyPublisher<[MenuItem], Error>
}
