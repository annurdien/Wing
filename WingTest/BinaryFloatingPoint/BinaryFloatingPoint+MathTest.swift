//
//  BinaryFloatingPoint+MathTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct BinaryFloatingPointMathTests {
  @Test func testSquared() {
    #expect(2.0.squared == 4.0)
    #expect((-3.0).squared == 9.0)
    #expect(0.0.squared == 0.0)
    #expect(1.5.squared == 2.25)
  }
  
  @Test func testCubed() {
    #expect(2.0.cubed == 8.0)
    #expect((-3.0).cubed == -27.0)
    #expect(0.0.cubed == 0.0)
    #expect(1.5.cubed == 3.375)
  }
  
  @Test func testPower() {
    #expect(2.0.power(3.0) == 8.0)
    #expect(3.0.power(2.0) == 9.0)
    #expect((-2.0).power(3.0) == -8.0)
    #expect(4.0.power(0.5) == 2.0)
    #expect(2.0.power(-1.0) == 0.5)
  }
  
  @Test func testSquareRoot() {
    #expect(4.0.squareRoot() == 2.0)
    #expect(9.0.squareRoot() == 3.0)
    #expect(0.0.squareRoot() == 0.0)
    #expect(1.0.squareRoot() == 1.0)
    #expect(16.0.squareRoot() == 4.0)
  }
}
