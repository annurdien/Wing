//
//  BinaryFloatingPoint+Clamping.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension BinaryFloatingPoint {
  /// Returns a value clamped to the inclusive range defined by `lowerBound` and `upperBound`.
  ///
  /// - Parameters:
  ///   - lowerBound: The lower bound of the range.
  ///   - upperBound: The upper bound of the range.
  /// - Returns: A value within the bounds of the range.
  @inlinable
  public func clamped(to range: ClosedRange<Self>) -> Self {
    return Swift.max(range.lowerBound, Swift.min(range.upperBound, self))
  }
  
  /// Returns a value clamped to the inclusive range defined by `lowerBound` and `upperBound`.
  ///
  /// - Parameters:
  ///   - lowerBound: The lower bound of the range.
  ///   - upperBound: The upper bound of the range.
  /// - Returns: A value within the bounds of the range.
  @inlinable
  public func clamped(lowerBound: Self, upperBound: Self) -> Self {
    return clamped(to: lowerBound...upperBound)
  }
  
  /// Mutates the value to be within the inclusive range defined by `lowerBound` and `upperBound`.
  ///
  /// - Parameters:
  ///   - lowerBound: The lower bound of the range.
  ///   - upperBound: The upper bound of the range.
  @inlinable
  public mutating func clamp(to range: ClosedRange<Self>) {
    self = clamped(to: range)
  }
  
  /// Mutates the value to be within the inclusive range defined by `lowerBound` and `upperBound`.
  ///
  /// - Parameters:
  ///   - lowerBound: The lower bound of the range.
  ///   - upperBound: The upper bound of the range.
  @inlinable
  public mutating func clamp(lowerBound: Self, upperBound: Self) {
    clamp(to: lowerBound...upperBound)
  }
}
