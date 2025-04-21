//
//  Collection+IterationTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct CollectionIterationTests {
  @Test func testForEachWithIndex() {
    let array = ["a", "b", "c"]
    var result: [String] = []
    array.forEach { index, element in
      result.append("\(index): \(element)")
    }
    #expect(result == ["0: a", "1: b", "2: c"])
    
    let emptyArray: [Int] = []
    var count = 0
    emptyArray.forEach { _, _ in
      count += 1
    }
    #expect(count == 0)
  }
}
