//
//  Collection+Iteration.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension Collection {
  /// Executes the given closure for each element in the collection, along with its index.
  ///
  /// - Parameter body: A closure that takes the index and the element as its arguments.
  @inlinable
  public func forEach(_ body: (Index, Element) throws -> Void) rethrows {
    for index in indices {
      try body(index, self[index])
    }
  }
}
