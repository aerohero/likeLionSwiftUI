//
//  MyProgressbarView.swift
//  TimerDemo
//
//  Created by Sean on 1/24/25.
//

import SwiftUI

struct MyProgressbarView: View {
    
    @Binding var timeRemaining: Double
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // 배경 원
            Circle()
                .stroke(lineWidth: 15)
                .foregroundColor(.blue)
            
            // 프로그레스 원
            Circle()
                .trim(from: 0.0, to: 1.0 - CGFloat(timeRemaining / 60))
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .foregroundColor(.gray)
                .rotationEffect(.degrees(0))
                .animation(.linear, value: timeRemaining)
        }
        .frame(width: 200, height: 200)
        
    }
}
