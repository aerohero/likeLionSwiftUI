//
//  Product.swift
//  StoreApp
//
//  Created by sean on 4/25/25.
//

import Foundation

struct Product: Identifiable, Equatable, Codable, Hashable {
  let id: Int
  let title: String
  let price: Double
  let description: String
  let category: String
  let image: String
}

extension Product {
  static let example = Product(
    id: 1,
    title: "Product 1",
    price: 10.0,
    description: "Description 1",
    category: "Category 1",
//    image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
    image: "https://picsum.photos/200/300"
  )
}
