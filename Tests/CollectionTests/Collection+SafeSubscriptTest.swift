//
//  Collection+SafeSubscriptTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct CollectionSafeSubscriptTests {
  @Test func testSafeSubscript() {
    let array = [1, 2, 3]
    #expect(array.safeSubscript(index: 1) == 2)
    #expect(array.safeSubscript(index: 3) == nil)
    #expect(array.safeSubscript(index: -1) == nil)
    #expect(array.safeSubscript(index: 0) == 1)
    
    let emptyArray: [Int] = []
    #expect(emptyArray.safeSubscript(index: 0) == nil)
  }
}
