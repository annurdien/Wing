//
//  Int+RandomTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

import Testing
@testable import Wing

struct BinaryIntRandomizationTests {
  @Test func testRandomInRange() {
    let range = 1...10
    for _ in 0..<100 {
      let randomNumber = Int.random(in: range)
      #expect(range.contains(randomNumber))
    }
    
    let singleValueRange = 5...5
    for _ in 0..<10 {
      let randomNumber = Int.random(in: singleValueRange)
      #expect(randomNumber == 5)
    }
  }
}
