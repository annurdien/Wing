//
//  BinaryFloatingPoint+ComparisonTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct BinaryFloatingPointComparisonTests {
  @Test func testIsApproximatelyEqualTo() {
    #expect(1.0.isApproximatelyEqual(to: 1.0))
    #expect(1.0.isApproximatelyEqual(to: 1.00000001))
    #expect(1.0.isApproximatelyEqual(to: 0.99999999))
    #expect(1.0.isApproximatelyEqual(to: 1.1, tolerance: 0.2))
    #expect(1.0.isApproximatelyEqual(to: 0.9, tolerance: 0.2))
    #expect(Float(1.0).isApproximatelyEqual(to: Float(1.0) + Float.ulpOfOne))
    #expect(Float(1.0).isApproximatelyEqual(to: Float(1.0) - Float.ulpOfOne))
    #expect(Double(1.0).isApproximatelyEqual(to: Double(1.0) + Double.ulpOfOne))
    #expect(Double(1.0).isApproximatelyEqual(to: Double(1.0) - Double.ulpOfOne))
    #expect(!1.0.isApproximatelyEqual(to: 1.01))
    #expect(!1.0.isApproximatelyEqual(to: 0.99))
    #expect(!1.0.isApproximatelyEqual(to: 1.2, tolerance: 0.1))
    #expect(!1.0.isApproximatelyEqual(to: 0.8, tolerance: 0.1))
  }
}
