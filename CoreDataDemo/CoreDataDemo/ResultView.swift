//
//  ResultView.swift
//  CoreDataDemo
//
//  Created by Sean on 1/16/25.
//

import SwiftUI
import CoreData

struct ResultView: View {
    var name: String
    var viewContext: NSManagedObjectContext
    
    @State var matches: [Product]?
    
    var body: some View {
        VStack {
            List {
                ForEach(matches ?? []) { match in
                    Text(match.name ?? "Not Found")
                    Spacer()
                    Text(match.quantity ?? "Not Found")
                }
            }
            .navigationTitle("Results")
        }
        .task {
            let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
            fetchRequest.entity = Product.entity()
            fetchRequest.predicate = NSPredicate(format: "name CONTAINS %@", name)
            matches = try? viewContext.fetch(fetchRequest)
        }
    }
}
