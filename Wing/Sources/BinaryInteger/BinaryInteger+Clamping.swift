//
//  Int+Clamping.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//


extension BinaryInteger {
  /// Returns the integer clamped to the inclusive range provided.
  ///
  /// ```swift
  /// let value = 15
  /// let clampedValue = value.clamped(to: 0...10) // Returns 10
  /// ```
  ///
  /// - Parameter range: The inclusive range to clamp the integer to.
  /// - Returns: The integer clamped to the bounds of the range.
  public func clamped(to range: ClosedRange<Self>) -> Self {
    return Swift.min(Swift.max(self, range.lowerBound), range.upperBound)
  }
}
