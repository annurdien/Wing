//
//  MutableCollection+SwapTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct MutableCollectionSafeSwapTests {
  @Test
  func testSafeSwapValidIndices() {
    var array = [1, 2, 3, 4, 5]
    array.swap(at: 0, with: 4)
    #expect(array == [5, 2, 3, 4, 1])
    
    var stringArray = ["a", "b", "c"]
    stringArray.swap(at: 1, with: 2)
    #expect(stringArray == ["a", "c", "b"])
    
    var singleElementArray = [10]
    singleElementArray.swap(at: 0, with: 0)
    #expect(singleElementArray == [10])
  }
  
  @Test
  func testSafeSwapInvalidIndex() {
    var array = [1, 2, 3]
    let originalArray = array
    array.swap(at: 0, with: 5) // Index 5 is out of bounds
    #expect(array == originalArray)
    
    var anotherArray = ["x", "y", "z"]
    let originalAnotherArray = anotherArray
    anotherArray.swap(at: -1, with: 1) // Index -1 is out of bounds
    #expect(anotherArray == originalAnotherArray)
    
    var yetAnotherArray = [true, false]
    let originalYetAnotherArray = yetAnotherArray
    yetAnotherArray.swap(at: 2, with: -1) // Both indices are out of bounds
    #expect(yetAnotherArray == originalYetAnotherArray)
    
    var boundaryArray = [1]
    let originalBoundaryArray = boundaryArray
    boundaryArray.swap(at: 0, with: 1) // Index 1 is out of bounds
    #expect(boundaryArray == originalBoundaryArray)
  }
  
  @Test
  func testSafeSwapEmptyCollection() {
    var emptyArray: [Int] = []
    let originalEmptyArray = emptyArray
    emptyArray.swap(at: 0, with: 0) // Indices are technically out of bounds
    #expect(emptyArray == originalEmptyArray)
  }
}
