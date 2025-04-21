//
//  MutableCollection+Swap.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension MutableCollection where Self: RandomAccessCollection {
  /// Swaps the elements at the two given indices if both indices are within the bounds of the collection.
  /// If either index is out of bounds, no swap occurs.
  ///
  /// - Parameters:
  ///   - index1: The index of the first element to swap.
  ///   - index2: The index of the second element to swap.
  @inlinable
  public mutating func swap(at index1: Index, with index2: Index) {
    guard indices.contains(index1), indices.contains(index2) else {
      return
    }
    swapAt(index1, index2)
  }
}
