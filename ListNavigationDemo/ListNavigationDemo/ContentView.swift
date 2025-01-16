//
//  ContentView.swift
//  ListNavigationDemo
//
//  Created by Sean on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    @State var carStore = CarStore(cars: carData)
    // CarStore 인스턴스를 상태로 관리
    @State var stackPath = NavigationPath()
    // 네비게이션 스택의 경로를 관리하는 상태 변수
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach(carStore.cars) { car in
                    NavigationLink(value: car) {
                        ListCell(car: car)
                    }
                } // 각 차량에 대한 네비게이션 링크 생성
                .onDelete(perform: deleteItems)
                // 스와이프로 삭제 기능 추가
                .onMove(perform: moveItems)
                // 드래그로 순서 변경 기능 추가
            }
            .navigationTitle(Text("EV Cars List"))
            .toolbar {
                // 왼쪽 상단에 새 차량 추가 버튼
                ToolbarItem(placement: .topBarLeading, content: {
                    NavigationLink(value: "Add Car") {
                        Text("Add")
                            .foregroundColor(.blue)
                    }
                })
                // 오른쪽 상단에 편집 버튼
                ToolbarItem(placement: .topBarTrailing, content: {
                    EditButton()
                })
            }
            // "Add Car" 문자열에 대한 네비게이션 목적지 정의
            .navigationDestination(for: String.self) { menuString in
                if menuString == "Add Car" {
                    AddNewCar(carStore: carStore, path: $stackPath)
                }
            }
            // Car 타입에 대한 네비게이션 목적지 정의
            .navigationDestination(for: Car.self) { car in
                CarDetail(selectedCar: car)
            }
        }
    }
    // 선택된 항목 삭제 함수
    func deleteItems(offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    // 항목 위치 이동 함수
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(car.name)
        }
    }
}


#Preview {
    ContentView()
}
