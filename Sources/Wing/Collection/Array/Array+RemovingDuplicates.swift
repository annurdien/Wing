//
//  Array+RemovingDuplicates.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension Array where Element: Hashable {
  /// Removes duplicate elements from the array, preserving the order of the first occurrence of each element.
  @inlinable
  public mutating func removeDuplicates() {
    var seen = Set<Element>()
    self = filter { element in
      if seen.contains(element) {
        return false
      } else {
        seen.insert(element)
        return true
      }
    }
  }
  
  /// Returns a new array with duplicate elements removed, preserving the order of the first occurrence of each element.
  ///
  /// - Returns: A new array with unique elements.
  @inlinable
  public func removingDuplicates() -> [Element] {
    var seen = Set<Element>()
    return filter { element in
      if seen.contains(element) {
        return false
      } else {
        seen.insert(element)
        return true
      }
    }
  }
}
