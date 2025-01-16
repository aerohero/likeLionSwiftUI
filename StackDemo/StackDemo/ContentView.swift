//
//  ContentView.swift
//  StackDemo
//
//  Created by Sean on 1/14/25.
//

import SwiftUI

// 새로운 커스텀 세로 정렬값을 추가
extension VerticalAlignment {
    private enum OneThird: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}
struct ContentView: View {
    var body: some View {
        HStack(alignment: .oneThird) {
            Rectangle()
                .fill(Color.green)
                .frame(width: 50, height: 200)
            Rectangle()
                .fill(Color.red)
                .alignmentGuide(.oneThird) { d in d[VerticalAlignment.top] }
                .frame(width: 50, height: 200)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 50, height: 200)
            Rectangle()
                .fill(Color.orange)
                .alignmentGuide(.oneThird) { d in d[VerticalAlignment.top] }
                .frame(width: 50, height: 200)
        }
//
//struct ContentView: View {
//    var body: some View {
//        // alignment 파라미터로 정렬
//        VStack(alignment: .leading) {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, swift world!")
//            Text("This is some text.")
//            Text("This is some long text.")
//            Text("This is short.")
//        }
//        .padding()
////        Spacer()
//        HStack(alignment: .top) {
//            Text("Hello, swift world!")
//                .font(.largeTitle)
//            Text("This is some text.")
//                .font(.body)
//            Text("This is some long text.")
//                .font(.headline)
//            Text("This is short.")
//                .font(.body)
//        }
//        .padding()
//        VStack(alignment: .leading) {
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 120, height: 50)
//            Rectangle()
//                .fill(Color.red)
//                .alignmentGuide(.leading,
//                                computeValue: { dimensions in dimensions.width / 3 })
//                .frame(width: 200, height: 50)
//            Rectangle()
//                .fill(Color.blue)
//                .alignmentGuide(.leading,
//                                computeValue: { dimensions in dimensions[.trailing] + 20 })
//                .frame(width: 180, height: 50)
//        }
    }
}

#Preview {
    ContentView()
}
