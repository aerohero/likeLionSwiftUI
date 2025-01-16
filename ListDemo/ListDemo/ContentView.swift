//
//  ContentView.swift
//  ListDemo
//
//  Created by Sean on 1/14/25.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        List {
//            Text("Wash the car")
//            Text("Vaccum house")
//            Text("Go to the gym")
//            Text("Pick up kids from school bus @ 3pm")
//            
//            HStack {
//                Image(systemName: "trash.circle.fill")
//                Text("Take out the trash")
//            }
//            HStack {
//                Image(systemName: "person.2.fill")
//                Text("Pick up the kids")
//            }
//            Text("Order Pizza for dinner")
//                .listRowSeparator(.hidden)
//            Text("Auction the kids on eBay")
//                .listRowSeparatorTint(.green)
//            Text("Wash the car")
//                .listRowBackground(Image("Apple_logo"))
//        }
//    }
//}


// Identifiable 프로토콜을 준수하는 ToDoItem 구조체 정의
// UUID를 통해 각 항목을 고유하게 식별
struct ToDoItem: Identifiable, Hashable {
    let id: UUID = UUID()   // 자동으로 생성되는 고유 식별자
    var task: String        // 할 일 텍스트
    var imageName: String   
}

struct ContentView: View {
    @State var toggleStatus: Bool = false
    // 토글 상태를 저장하는 State 변수
    
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "tash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ] // ToDo 항목들을 저장하는 State 배열
    
    var body: some View {
        NavigationStack {
            List {
                // 설정 섹션
                Section(header: Text("Settings")) {
                    // 알림 허용 토글 스위치
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifications")
                    }
                    NavigationLink(value: listData.count) {
                        Text("View Task Count")
                    }
                }
                Section(header: Text("To Do Tasks")) {
                    ForEach(listData) { item in
                        NavigationLink(value: item.task) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }
            
            .navigationTitle(Text("To Do List")) // 네비게이션 바 타이틀 지정
            
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading, content: {EditButton()})
                ToolbarItem(placement: .primaryAction, content: { Button("Add", action: {})})
            })
            // 최신 업데이트: 네비게이션 바 아이템 대신 ToolbarItem 을 사용함.
            
            .navigationBarTitleDisplayMode(.inline) // 바 스타일
            
            // NavigationLink value 타입에 따른 뷰 빌더를 실행시켜주는 수정자
            .navigationDestination(for: ToDoItem.self) { item in
                // GET ToDoItem
                Text("Number of tasks: \(item.task) ( \(item.id)")
            }
            .navigationDestination(for: Int.self) { count in
                Text("Number of task = \(count)")
            }
            .navigationDestination(for: String.self) { task in
                VStack {
                    Text("Selected task = \(task)")
                }
            }
            // 당겨서 새로고침 기능 추가
            .refreshable {
                // 새로운 ToDo 항목들로 리스트 갱신
                listData = [
                    ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                    ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                    ToDoItem(task: "Call the kids", imageName: "person.2.fill")
                ]
            }
        }
    }
    // 항목 삭제 로직
    func deleteItem(at offsets: IndexSet) {
        print("delete item: \(offsets)")
        listData.remove(atOffsets: offsets)
    }
    // 항목 이동 로직
    func moveItem(from source: IndexSet, to destination: Int) {
        print("source: \(source), destination: \(destination)")
        listData.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView()
}
