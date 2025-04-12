//
//  BinaryFloatingPoint+PropertiesTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct BinaryFloatingPointPropertiesTests {
  @Test
  func testIsPositive() {
    #expect(5.0.isPositive == true)
    #expect(0.1.isPositive == true)
    #expect(0.0.isPositive == false)
    #expect((-0.0).isPositive == false)
    #expect((-3.0).isPositive == false)
  }
  
  @Test
  func testIsNegative() {
    #expect((-5.0).isNegative == true)
    #expect((-0.1).isNegative == true)
    #expect(0.0.isNegative == false)
    #expect((-0.0).isNegative == false)
    #expect(3.0.isNegative == false)
  }
}
