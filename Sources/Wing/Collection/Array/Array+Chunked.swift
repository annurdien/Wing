//
//  Array+Chunked.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension Array {
  /// Splits the array into chunks of the specified size.
  /// The last chunk may contain fewer elements if the array's count is not a multiple of the chunk size.
  ///
  /// - Parameter size: The desired size of each chunk. Must be greater than 0.
  /// - Returns: An array of arrays, where each inner array represents a chunk.
  @inlinable
  public func chunked(into size: Int) -> [[Element]] {
    guard size > 0 else { return [self] }
    return stride(from: 0, to: count, by: size).map {
      Array(self[$0..<Swift.min($0 + size, count)])
    }
  }
}
