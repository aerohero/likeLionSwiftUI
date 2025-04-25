//
//  ProductDetailView.swift
//  StoreApp
//
//  Created by sean on 4/25/25.
//

import SwiftUI
import ComposableArchitecture

struct ProductDetailView: View {
  
  @Bindable var store: StoreOf<ProductDetailFeature>
  let appStore: StoreOf<AppFeature>
  
  var cartItemCount: Int {
    appStore.cart.items.count
  }
  
  var body: some View {
    ScrollView {
      if let product = store.product {
        VStack(alignment: .leading) {
          AsyncImage(url: URL(string: product.image)) { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(maxWidth: .infinity, maxHeight: 300)
          } placeholder: {
            ProgressView()
          }
          Text(product.title)
            .font(.largeTitle)
            .padding(.top)
          Text("$\(product.price, specifier: "%.2f")")
            .font(.title2)
            .padding(.top, 5)
          Text(product.description)
            .padding(.top, 10)
          
          // 수량 선택기
          Stepper(
            "수량: \(store.quantity)",
            value: Binding(get: { store.quantity },
                           set: { store.send(.quantityChanged($0)) }),
            in: 1...100
          )
          .padding(.top, 20)
          
          // 장바구니 추가 버튼
          Button(action: {
            store.send(.addToCartButtonTapped)
          }) {
            Text("장바구니에 추가")
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.blue)
              .foregroundColor(.white)
              .cornerRadius(8)
          }
          .padding(.top, 10)
        }
        .padding()
      } else if store.isLoading {
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle())
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      } else if let error = store.error {
        Text("Error: \(error)")
          .foregroundColor(.red)
          .padding()
      }
    }
    .navigationTitle("Product Details")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        NavigationLink(destination: CartListView(store: appStore.scope(state: \.cart, action: \.cart))) {
          Image(systemName: "cart")
            .foregroundColor(.blue)
            .overlay(
              alignment: .topTrailing
            ) {
              if cartItemCount > 0 {
                Text("\(cartItemCount)")
                  .font(.caption)
                  .foregroundColor(.white)
                  .padding(4)
                  .background(Color.red)
                  .clipShape(Circle())
                  .offset(x: 10, y: -10)
              }
            }
        }
      }
    }
  }
}
