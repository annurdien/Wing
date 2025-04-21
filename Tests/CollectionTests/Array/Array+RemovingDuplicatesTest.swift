//
//  Array+RemovingDuplicatesTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct ArrayRemoveDuplicatesTests {
  @Test func testRemoveDuplicates() {
    var arrayWithDuplicates = [1, 2, 3, 1, 4, 2, 5]
    arrayWithDuplicates.removeDuplicates()
    #expect(arrayWithDuplicates == [1, 2, 3, 4, 5])
    
    var arrayWithoutDuplicates = [1, 2, 3, 4, 5]
    arrayWithoutDuplicates.removeDuplicates()
    #expect(arrayWithoutDuplicates == [1, 2, 3, 4, 5])
    
    var emptyArray: [Int] = []
    emptyArray.removeDuplicates()
    #expect(emptyArray == [])
    
    var arrayWithAllDuplicates = [1, 1, 1, 2, 2, 2]
    arrayWithAllDuplicates.removeDuplicates()
    #expect(arrayWithAllDuplicates == [1, 2])
    
    var arrayWithMixedTypes: [AnyHashable] = [1, "a", 1, "b", "a"]
    arrayWithMixedTypes.removeDuplicates()
    #expect(arrayWithMixedTypes == [1, "a", "b"])
  }
  
  @Test  func testRemovingDuplicates() {
    let arrayWithDuplicates = [1, 2, 3, 1, 4, 2, 5]
    let uniqueArray = arrayWithDuplicates.removingDuplicates()
    #expect(uniqueArray == [1, 2, 3, 4, 5])
    
    let arrayWithoutDuplicates = [1, 2, 3, 4, 5]
    let uniqueArray2 = arrayWithoutDuplicates.removingDuplicates()
    #expect(uniqueArray2 == [1, 2, 3, 4, 5])
    
    let emptyArray: [Int] = []
    let uniqueArray3 = emptyArray.removingDuplicates()
    #expect(uniqueArray3 == [])
    
    let arrayWithAllDuplicates = [1, 1, 1, 2, 2, 2]
    let uniqueArray4 = arrayWithAllDuplicates.removingDuplicates()
    #expect(uniqueArray4 == [1, 2])
    
    let arrayWithMixedTypes: [AnyHashable] = [1, "a", 1, "b", "a"]
    let uniqueArray5 = arrayWithMixedTypes.removingDuplicates()
    #expect(uniqueArray5 == [1, "a", "b"])
  }
}
