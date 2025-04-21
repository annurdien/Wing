//
//  Optional+Collection.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension Optional where Wrapped: Collection {
  /// Returns `true` if the optional is `nil` or if the wrapped collection is empty.
  @inlinable
  public var isNilOrEmpty: Bool {
    switch self {
    case .none:
      return true
    case .some(let collection):
      return collection.isEmpty
    }
  }
}
