//
//  BinaryFloatingPoint+FormattingTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct BinaryFloatingPointFormattingTests {
  @Test
  func testFormattedWithFractionDigits() {
    // USPosix locale
    #expect(3.14159.formatted(withFractionDigits: 2) == "3.14")
    #expect(5.0.formatted(withFractionDigits: 0) == "5")
    #expect(10.75.formatted(withFractionDigits: 1) == "10.8")
    #expect((-2.5).formatted(withFractionDigits: 1) == "-2.5")
    #expect(0.0.formatted(withFractionDigits: 3) == "0.000")
  }
}
