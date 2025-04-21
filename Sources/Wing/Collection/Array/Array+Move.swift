//
//  Array+Move.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension Array {
  /// Moves an element from a specified index to another index within the array.
  /// If the indices are out of bounds, the array remains unchanged.
  ///
  /// - Parameters:
  ///   - fromIndex: The index of the element to move.
  ///   - toIndex: The index where the element should be moved to.
  @inlinable
  public mutating func move(from fromIndex: Index, to toIndex: Index) {
    guard indices.contains(fromIndex), indices.contains(toIndex), fromIndex != toIndex else {
      return
    }
    let element = remove(at: fromIndex)
    insert(element, at: toIndex)
  }
  
  /// Returns a new array with an element moved from a specified index to another index.
  /// If the indices are out of bounds, the original array is returned unchanged.
  ///
  /// - Parameters:
  ///   - fromIndex: The index of the element to move.
  ///   - toIndex: The index where the element should be moved to.
  /// - Returns: A new array with the element moved, or the original array if indices are invalid.
  @inlinable
  public func moving(from fromIndex: Index, to toIndex: Index) -> Self {
    guard indices.contains(fromIndex), indices.contains(toIndex), fromIndex != toIndex else {
      return self
    }
    var newArray = self
    let element = newArray.remove(at: fromIndex)
    newArray.insert(element, at: toIndex)
    return newArray
  }
}
