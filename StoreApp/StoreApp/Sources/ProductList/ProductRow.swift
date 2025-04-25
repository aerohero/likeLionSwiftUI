//
//  ProductRow.swift
//  StoreApp
//
//  Created by sean on 4/25/25.
//
import SwiftUI
import ComposableArchitecture

struct ProductRow: View {
  
  let product: Product
  
  var body: some View {
    HStack {
      AsyncImage(url: URL(string: product.image)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50, height: 50)
      } placeholder: {
        ProgressView()
      }
      VStack(alignment: .leading) {
        Text(product.title)
          .font(.headline)
        Text("$\(product.price, specifier: "%.2f")")
          .font(.subheadline)
      }
    }
  }
}
