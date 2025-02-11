//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Sean on 1/16/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var name: String = "" // 접근 vs 외부에서 접근하기 위해선 @Binding 사용해야
    @State var quantity: String = ""
    
    @Environment(\.modelContext) private var modelContext // Open public internal private
    @Query private var products: [Product]

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Product name", text: $name)
                TextField("Product quantity", text: $quantity)
                
                HStack {
                    Spacer()
                    Button(action: { addProduct() },
                           label: { Text("Add") })
                    Spacer()
                    NavigationLink(destination: ResultView(name: name)) {
                        Text("Find") // search
                    }
                    Spacer()
                    Button(action: {
                        name = ""
                        quantity = ""
                    }, label: { Text("Clear") })
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                List {
                    ForEach(products) { product in
                        NavigationLink {
                            Text("Product at \(product.name ?? "Not Found")")
                        } label: {
                            HStack {
                                Text(product.name ?? "Not Found")
                                Spacer()
                                Text(product.quantity ?? "Not Found")
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationTitle("Products")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    private func addProduct() {
        withAnimation {
            let newItem = Product(name: name, quantity: quantity)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(products[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Product.self, inMemory: true)
}
