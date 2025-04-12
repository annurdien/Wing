//
//  BinaryFloatingPont+Comparison.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension BinaryFloatingPoint {
  /// Returns a Boolean value indicating whether the current value is approximately equal to another value within a specified tolerance.
  ///
  /// - Parameters:
  ///   - other: The value to compare against.
  ///   - tolerance: The maximum difference allowed for considering the values approximately equal.
  /// - Returns: `true` if the values are approximately equal, otherwise `false`.
  @inlinable
  public func isApproximatelyEqual(to other: Self, tolerance: Self = Self.ulpOfOne.squareRoot()) -> Bool {
    return Swift.abs(self - other) < tolerance
  }
}
