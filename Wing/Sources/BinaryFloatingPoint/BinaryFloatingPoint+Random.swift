//
//  BinaryFloatingPoint+Random.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation
import CoreGraphics

extension BinaryFloatingPoint {
  /// Returns a random floating-point number between 0.0 (inclusive) and 1.0 (exclusive).
  ///
  /// - Returns: A random floating-point number.
  @inlinable
  public static func random() -> Self {
    if Self.self == CGFloat.self {
      return (CGFloat(arc4random()) / CGFloat(UInt32.max)) as! Self
    } else {
      return Self(Double.random(in: 0.0..<1.0))
    }
  }
  
  /// Returns a random floating-point number within the specified inclusive range.
  ///
  /// - Parameter range: The range within which to generate a random number.
  /// - Returns: A random floating-point number within the range.
  @inlinable
  public static func random(in range: ClosedRange<Self>) -> Self {
    if Self.self == CGFloat.self {
      let r = random()
      return r * (range.upperBound - range.lowerBound) + range.lowerBound 
    } else {
      return Self(Double.random(in: Double(range.lowerBound)...Double(range.upperBound)))
    }
  }
  
  /// Returns a random floating-point number within the specified inclusive range.
  ///
  /// - Parameters:
  ///   - lowerBound: The lower bound of the range.
  ///   - upperBound: The upper bound of the range.
  /// - Returns: A random floating-point number within the range.
  @inlinable
  public static func random(in lowerBound: Self, _ upperBound: Self) -> Self {
    return random(in: lowerBound...upperBound)
  }
}
