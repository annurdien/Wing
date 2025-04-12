//
//  Int+ConversionTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

import Testing
import CoreGraphics
@testable import Wing

struct IntConversionTests {
  
  @Test func testToString() {
    #expect(0.string == "0")
    #expect(123.string == "123")
    #expect((-456).string == "-456")
  }
  
  @Test func testToCGFloat() {
    #expect(0.cgFloat == CGFloat(0))
    #expect(10.cgFloat == CGFloat(10))
    #expect((-5).cgFloat == CGFloat(-5))
  }
  
  @Test func testToDouble() {
    #expect(0.double == Double(0))
    #expect(10.double == Double(10))
    #expect((-5).double == Double(-5))
  }
  
  @Test func testToFloat() {
    #expect(0.float == Float(0))
    #expect(10.float == Float(10))
    #expect((-5).float == Float(-5))
  }
  
  @Test func testToBool() {
    #expect(0.bool == false)
    #expect(1.bool == true)
    #expect((-1).bool == true)
    #expect(100.bool == true)
  }
}
