//
//  BinaryFloatingPoint+ConversionTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
import CoreGraphics

@testable import Wing

struct BinaryFloatingPointConversionTests {
  @Test func testInteger() {
    #expect(5.7.integer == 5)
    #expect((-3.2).integer == -3)
    #expect(0.0.integer == 0)
    #expect(10.0.integer == 10)
  }
  
  @Test func testDouble() {
    #expect(Float(3.14).double == Double(3.140000104904175))
    #expect(CGFloat(2.71).double == Double(2.71))
    #expect(5.0.double == 5.0)
  }
  
  @Test func testFloat() {
    #expect(Double(3.14).float == Float(3.14))
    #expect(CGFloat(2.71).float == Float(2.71))
    #expect(5.0.float == 5.0)
  }
}
