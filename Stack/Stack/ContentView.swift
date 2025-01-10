//
//  ContentView.swift
//  Stack
//
//  Created by Sean on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    
    var colors: [Color] = [.black, .red, .green, .blue]
    var colorNames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcom to SwiftUI"
    
    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation)) // DK; rotation 값을 저장하는 것이 아니라 참조만 하면 되므로 $를 사용하지 않는다.
                .animation(.easeInOut(duration: 5), value: rotation)
                .foregroundStyle(colors[colorIndex])
            
            Spacer()
            Divider()
            Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                .padding()
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach (0 ..< colorNames.count, id:\.self) { color in
                    Text(colorNames[color])
                        .foregroundStyle(colors[color])
                }
            }
            .pickerStyle(.wheel)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
