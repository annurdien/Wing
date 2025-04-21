//
//  Optional+Collection.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct OptionalCollectionTests {
  @Test func testIsNilOrEmpty() {
    let emptyArray: [Int]? = []
    #expect(emptyArray.isNilOrEmpty == true)
    
    let nilArray: [Int]? = nil
    #expect(nilArray.isNilOrEmpty == true)
    
    let nonEmptyArray: [Int]? = [1, 2]
    #expect(nonEmptyArray.isNilOrEmpty == false)
    
    let emptyDictionary: [String: Int]? = [:]
    #expect(emptyDictionary.isNilOrEmpty == true)
    
    let nilDictionary: [String: Int]? = nil
    #expect(nilDictionary.isNilOrEmpty == true)
    
    let nonEmptyDictionary: [String: Int]? = ["a": 1]
    #expect(nonEmptyDictionary.isNilOrEmpty == false)
  }
}
