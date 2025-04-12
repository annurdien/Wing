//
//  Int+BasicTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

import Testing
@testable import Wing

struct IntBasicPropertiesTests {
  
  @Test func testIsEven() {
    #expect(0.isEven == true)
    #expect(2.isEven == true)
    #expect((-4).isEven == true)
    #expect(1.isEven == false)
    #expect((-3).isEven == false)
  }
  
  @Test func testIsOdd() {
    #expect(0.isOdd == false)
    #expect(2.isOdd == false)
    #expect((-4).isOdd == false)
    #expect(1.isOdd == true)
    #expect((-3).isOdd == true)
  }
  
  @Test func testIsPositive() {
    #expect(1.isPositive == true)
    #expect(100.isPositive == true)
    #expect(0.isPositive == false)
    #expect((-1).isPositive == false)
  }
  
  @Test func testIsNegative() {
    #expect((-1).isNegative == true)
    #expect((-100).isNegative == true)
    #expect(0.isNegative == false)
    #expect(1.isNegative == false)
  }
  
  @Test func testIsZero() {
    #expect(0.isZero == true)
    #expect(1.isZero == false)
    #expect((-1).isZero == false)
  }
  
  @Test func testAbsoluteValue() {
    #expect(0.absoluteValue == 0)
    #expect(5.absoluteValue == 5)
    #expect((-5).absoluteValue == 5)
  }
}
