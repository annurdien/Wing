//
//  Int+RangeIterationTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

import Testing
@testable import Wing

struct IntRangeIterationTests {
  
  @Test func testTimes() {
    var count = 0
    3.times { count += 1 }
    #expect(count == 3)
    
    count = 0
    0.times { count += 1 }
    #expect(count == 0)
    
    count = 0
    (-2).times { count += 1 }
    #expect(count == 0)
  }
  
  @Test func testUpto() {
    var result = [Int]()
    1.upto(5) { result.append($0) }
    #expect(result == [1, 2, 3, 4, 5])
    
    result = [Int]()
    3.upto(3) { result.append($0) }
    #expect(result == [3])
    
    result = [Int]()
    5.upto(1) { result.append($0) }
    #expect(result == [])
  }
  
  @Test func testDownto() {
    var result = [Int]()
    5.downto(1) { result.append($0) }
    #expect(result == [5, 4, 3, 2, 1])
    
    result = [Int]()
    3.downto(3) { result.append($0) }
    #expect(result == [3])
    
    result = [Int]()
    1.downto(5) { result.append($0) }
    #expect(result == [])
  }
  
  @Test func testForEachPositiveCount() {
      var count = 0
      3.forEach { _ in
          count += 1
      }
      #expect(count == 3)

      var sum = 0
      5.forEach { index in
          sum += index
      }
      #expect(sum == 0 + 1 + 2 + 3 + 4) // Sum of indices from 0 to 4
  }

  @Test func testForEachZeroCount() {
      var count = 0
      0.forEach { _ in
          count += 1
      }
      #expect(count == 0)
  }

  @Test func testForEachNegativeCount() {
      var count = 0
      (-2).forEach { _ in
          count += 1
      }
      #expect(count == 0)
  }
}
