//
//  Array+Move.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct ArrayMoveTests {
  @Test
  func testMove() {
    var array = [1, 2, 3, 4, 5]
    array.move(from: 0, to: 2)
    #expect(array == [2, 3, 1, 4, 5])
    
    var array2 = ["a", "b", "c", "d"]
    array2.move(from: 3, to: 0)
    #expect(array2 == ["d", "a", "b", "c"])
    
    var array3 = [10, 20, 30]
    array3.move(from: 1, to: 1)
    #expect(array3 == [10, 20, 30]) // No change
    
    var array4 = [5]
    array4.move(from: 0, to: 0)
    #expect(array4 == [5]) // No change
    
    var arrayOutOfBounds = [1, 2]
    arrayOutOfBounds.move(from: 0, to: 5)
    #expect(arrayOutOfBounds == [1, 2])
    
    var arrayOutOfBounds2 = [1, 2]
    arrayOutOfBounds2.move(from: -1, to: 0)
    #expect(arrayOutOfBounds2 == [1, 2])
  }
  
  @Test
  func testMoving() {
    let array = [1, 2, 3, 4, 5]
    let movedArray = array.moving(from: 0, to: 2)
    #expect(movedArray == [2, 3, 1, 4, 5])
    #expect(array == [1, 2, 3, 4, 5]) // Original array unchanged
    
    let array2 = ["a", "b", "c", "d"]
    let movedArray2 = array2.moving(from: 3, to: 0)
    #expect(movedArray2 == ["d", "a", "b", "c"])
    #expect(array2 == ["a", "b", "c", "d"]) // Original array unchanged
    
    let array3 = [10, 20, 30]
    let movedArray3 = array3.moving(from: 1, to: 1)
    #expect(movedArray3 == [10, 20, 30]) // No change
    #expect(array3 == [10, 20, 30]) // Original array unchanged
    
    let array4 = [5]
    let movedArray4 = array4.moving(from: 0, to: 0)
    #expect(movedArray4 == [5]) // No change
    #expect(array4 == [5]) // Original array unchanged
    
    let arrayOutOfBounds = [1, 2]
    let movedArrayOutOfBounds = arrayOutOfBounds.moving(from: 0, to: 5)
    #expect(movedArrayOutOfBounds == [1, 2])
    #expect(arrayOutOfBounds == [1, 2]) // Original array unchanged
    
    let arrayOutOfBounds2 = [1, 2]
    let movedArrayOutOfBounds2 = arrayOutOfBounds2.moving(from: -1, to: 0)
    #expect(movedArrayOutOfBounds2 == [1, 2])
    #expect(arrayOutOfBounds2 == [1, 2]) // Original array unchanged
  }
}
