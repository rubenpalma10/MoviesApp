//
//  MoviesAppTests.swift
//  MoviesAppTests
//
//  Created by rapalma on 10/4/23.
//

import XCTest
@testable import MoviesApp

final class MoviesAppTests: XCTestCase {

    
    func testSum() {
        print("suma")
         let calculator = Calculator()
         XCTAssertEqual(calculator.sum(2, 2), 4)
         XCTAssertEqual(calculator.sum(0, 0), 0)
         XCTAssertEqual(calculator.sum(-5, 5), 0)
     }
     
     func testMultiply() {
         print("multiplicar")
         let calculator = Calculator()
         XCTAssertEqual(calculator.multiply(2, 2), 4)
         XCTAssertEqual(calculator.multiply(0, 0), 0)
         XCTAssertEqual(calculator.multiply(-5, 5), -25)
     }
}
