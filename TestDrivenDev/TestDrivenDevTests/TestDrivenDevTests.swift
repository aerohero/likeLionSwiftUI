//
//  TestDrivenDevTests.swift
//  TestDrivenDevTests
//
//  Created by sean on 4/14/25.
//

import XCTest
@testable import TestDrivenDev
// 모듈이 테스트 가능하도록 @testable 추가해야 한다.

final class TestDrivenDevTests: XCTestCase {
  //
  //  override func setUp() {
  //    print("setUp")
  //  }
  //
  //  override func tearDown() {
  //    print("tearDown")
  //  }
  //
  // 제일 처음 호출
  override func setUpWithError() throws {
    print("setUpWithError")
  }
  
  // 제일 마지막에 호출
  override func tearDownWithError() throws {
    print("tearDownWithError")
  }
  
  func testFizzBuzzDivisibleBy3() throws {
    let result = fizzBuzz(3)
    XCTAssertEqual(result, "fizz")
  }
  
  func testFizzBuzzDivisibleBy5() throws {
    let result = fizzBuzz(5)
    XCTAssertEqual(result, "buzz")
  }
  
  func testFizzBuzzDivisibleBy15() throws {
    let result = fizzBuzz(15)
    XCTAssertEqual(result, "fizz-buzz")
  }
  
  func testFizzBuzzNotDivisibaleBy3Or5ReturnInput() throws {
    let result = fizzBuzz(7)
    XCTAssertEqual(result, "7")
  }
  
  func testAsyncSum() async throws {
    await asyncSum(a: 3, b: 5) {
      result in
      XCTAssertEqual(result, 8)
    }
  }
}
