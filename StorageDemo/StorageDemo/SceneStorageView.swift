//
//  SceneStorageView.swift
//  StorageDemo
//
//  Created by Sean on 1/13/25.
//

import SwiftUI

struct SceneStorageView: View {
    //    @State private var editorText: String = ""
    @SceneStorage("mytext") private var editorText: String = ""
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    SceneStorageView()
}
