//
//  Array+Chunked.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct ArrayChunkedTests {
  @Test func testChunkedInto() {
    let array = [1, 2, 3, 4, 5, 6, 7]
    #expect(array.chunked(into: 2) == [[1, 2], [3, 4], [5, 6], [7]])
    #expect(array.chunked(into: 3) == [[1, 2, 3], [4, 5, 6], [7]])
    #expect(array.chunked(into: 1) == [[1], [2], [3], [4], [5], [6], [7]])
    #expect(array.chunked(into: 7) == [[1, 2, 3, 4, 5, 6, 7]])
    #expect(array.chunked(into: 10) == [[1, 2, 3, 4, 5, 6, 7]])
    
    let emptyArray: [Int] = []
    #expect(emptyArray.chunked(into: 3) == [])
    
    let singleElementArray = [1]
    #expect(singleElementArray.chunked(into: 2) == [[1]])
    
    let sizeZeroArray = [1, 2, 3]
    #expect(sizeZeroArray.chunked(into: 0) == [[1, 2, 3]])
    
    let negativeSizeArray = [1, 2, 3]
    #expect(negativeSizeArray.chunked(into: -1) == [[1, 2, 3]])
  }
}
