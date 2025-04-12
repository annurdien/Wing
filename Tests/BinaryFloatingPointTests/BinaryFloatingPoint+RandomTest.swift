//
//  BinaryFloatingPoint+RandomTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing
import CoreGraphics

struct BinaryFloatingPointRandomTests {
  @Test
  func testRandom() {
    for _ in 0..<100 {
      let randomDouble = Double.random()
      #expect(randomDouble >= 0.0 && randomDouble < 1.0)
      
      let randomFloat = Float.random()
      #expect(randomFloat >= 0.0 && randomFloat < 1.0)
      
      let randomCGFloat = CGFloat.random()
      #expect(randomCGFloat >= 0.0 && randomCGFloat < 1.0)
    }
  }
  
  @Test
  func testRandomInRange() {
    let rangeDouble = -5.0...10.0
    for _ in 0..<100 {
      let randomValue = Double.random(in: rangeDouble)
      #expect(randomValue >= rangeDouble.lowerBound && randomValue <= rangeDouble.upperBound)
    }
    
    let rangeFloat = 1.0.float...5.0.float
    for _ in 0..<100 {
      let randomValue = Float.random(in: rangeFloat)
      #expect(randomValue >= rangeFloat.lowerBound && randomValue <= rangeFloat.upperBound)
    }
    
    let rangeCGFloat = 0.0.cgFloat...1.0.cgFloat
    for _ in 0..<100 {
      let randomValue = CGFloat.random(in: rangeCGFloat)
      #expect(randomValue >= rangeCGFloat.lowerBound && randomValue <= rangeCGFloat.upperBound)
    }
    
    let simpleRangeDouble: ClosedRange<Double> = 2.0...7.0
    for _ in 0..<100 {
      let randomValue = Double.random(in: simpleRangeDouble)
      #expect(randomValue >= 2.0 && randomValue <= 7.0)
    }
  }
  
  @Test
  func testRandomInLowerAndUpperBound() {
    for _ in 0..<100 {
      let randomDouble = Double.random(in: -2.0, 8.0)
      #expect(randomDouble >= -2.0 && randomDouble <= 8.0)
      
      let randomFloat = Float.random(in: 0.5, 3.5)
      #expect(randomFloat >= 0.5 && randomFloat <= 3.5)
      
      let randomCGFloat = CGFloat.random(in: -1.0, 1.0)
      #expect(randomCGFloat >= -1.0 && randomCGFloat <= 1.0)
    }
  }
}
