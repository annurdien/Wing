//
//  Int+Clamping.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

import Testing
@testable import Wing

struct BinaryIntClampingTests {
  @Test func testClampedToRangeWithinBounds() {
    let value = 5
    let range = 0...10
    #expect(value.clamped(to: range) == 5)
  }
  
  @Test func testClampedToRangeLowerBound() {
    let value = -2
    let range = 0...10
    #expect(value.clamped(to: range) == 0)
  }
  
  @Test func testClampedToRangeUpperBound() {
    let value = 15
    let range = 0...10
    #expect(value.clamped(to: range) == 10)
  }
  
  @Test func testClampedToSingleValueRange() {
    let value = 7
    let range = 7...7
    #expect(value.clamped(to: range) == 7)
  }
}
