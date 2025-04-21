//
//  Collection+SafeSubscript.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension Collection {
  /// Returns the element at the specified index if it is within the bounds of the collection, otherwise returns `nil`.
  ///
  /// - Parameter index: The index of the element to retrieve.
  /// - Returns: The element at the given index, or `nil` if the index is out of bounds.
  @inlinable
  public func safeSubscript(index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
