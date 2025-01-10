//
//  ContentView.swift
//  HelloWorld
//
//  Created by Sean on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var wifiEnabled = false
    @State private var userName = ""
    
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnabled) {
                Text("Wifi Enabled")
//                Text("\(wifiEnabled)")
            }
            TextField("Enter User Name", text: $userName)
            Text(userName)
            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
        }
    }
}

struct GeomeryContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Hello World, how are you?")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 2,
                           height: (geometry.size.height / 4) * 3)
                Text("Goodbye World")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 3,
                           height: geometry.size.height / 4)
            }
        }
    }
}

struct FrameContentView: View {
    var body: some View {
        Text("Hello World")
            .font(.largeTitle)
//            .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 100, alignment: .center)
            .border(Color.black)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.red)
//            .ignoresSafeArea(.all)
//            .frame(width: 300, height: 100, alignment: .center)
    }
}

struct LayoutContentView: View {
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
    
    var body: some View {
        myLayout {
            Text("Sample Text")
            Text("Sample Text")
            Text("Sample Text")
        }
        HStack {
            Button(action: {
                myLayout = AnyLayout(HStackLayout())
            }) {
                Text("HStack")
            }
           Button(action: {
               myLayout = AnyLayout(VStackLayout())
           }) {
               Text("VStack")
           }
                  }
                  
                  HStack {
                      Image(systemName: "airplane")
                      Text("Flight times:")
                          .layoutPriority(1) // 우선순위 부여
                      Text("London")
                  }
                  .font(.largeTitle)
                  .lineLimit(1) // 글씨 크기로 인해 줄 바뀜을 제한
              }
          }


struct AlignmentContentView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
                Image(systemName: "goforward.30")
            }
            ZStack {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
                Image(systemName: "goforward.30")
            }
            // 복잡한 중첩 레이아웃 예시
            Text("Financial Results")
                .font(.title)
            HStack {
                Text("Q1 Sales")
                    .font(.headline)
                VStack {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                VStack {
                    Text("$1000")
                    Text("$200")
                    Text("$3000")
                }
            }
            // 정렬, 여백
            HStack(alignment: .top) {
                Text("Q1 Sales")
                    .font(.headline)
                Spacer()
                VStack(alignment: .leading) {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("$1000")
                    Text("$200")
                    Text("$3000")
                }
            }
        }
    }
}


struct MyVStack<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}

// 커스텀 레이블 스타일 (레이아웃)
struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center) {
            configuration.icon
                .padding(5)
            configuration.title
        }
    }
}

struct TextButtonLabelContentView: View {
    var body: some View {
        MyVStack {
            Text("Text 1")
            Text("Text 2")
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
            Button(action: { print("click") }) {   // print 부분은 클로저로 작성된 것이다.
                Label("Welcome to SwiftUI",
                      systemImage: "person.circle.fill")
            }
            Label(title: {
                Text("안녕하세요. 환영합니다.")
                    .font(.largeTitle)
                },
                icon: {
                    Circle()
                    .fill(Color.blue)
                    .frame(width: 25, height: 25)
            })
            .labelStyle(.titleAndIcon)
            Label("수직 레이블", systemImage: "moon.fill")
                .labelStyle(VerticalLabelStyle())
        }
    }
}

struct CountContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("count")
                .font(.largeTitle)
            
            Text("\(count)")
                .font(.system(size: 100))
                .fontWeight(.bold)
                .foregroundStyle(count % 2 == 0 ? .blue : .red)
            
            HStack {
                Button(action: {
                    self.count -= 1
                }, label: {
                    Text("-")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.gray)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                })
                
                Spacer()
                
                // 버튼의 다른 생성자 함수
                Button("+2", action: {
                    self.count += 2
                })
                .font(.largeTitle)
                
                Spacer()
                
                Button(action: {
                    self.count += 1
                }, label: {
                    Text("+")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.green)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                })
            }
        }
        .padding()
    }
}

struct MyStack: View {
    var body : some View {
        // 세로 정렬 (수직 배열 레이아웃) VStack
        VStack {
            Text("Text1")
            Text("Text2")
            Text("Text3")
            // 수평 배열 레이아웃 HStack
            HStack {
                Text("Text4")
                Text("Text5")
                Text("Hello") + Text("World")
            }
        }

        VStack {
            Image(systemName: "globe.desk")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}


#Preview {
    ContentView()   // 여기에 구조체 이름을 넣으면, 프리뷰에서 나타난다.
}
