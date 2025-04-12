//
//  BinaryFloatingPoint+Math.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension BinaryFloatingPoint {
  /// Returns the square of the current value.
  @inlinable
  public var squared: Self {
    return self * self
  }
  
  /// Returns the cube of the current value.
  @inlinable
  public var cubed: Self {
    return self * self * self
  }
  
  /// Returns the result of raising the current value to the power of the given exponent.
  ///
  /// - Parameter exponent: The exponent to raise the value to.
  /// - Returns: The result of the exponentiation.
  @inlinable
  public func power(_ exponent: Self) -> Self {
    return Self(Foundation.pow(Double(self), Double(exponent)))
  }
  
  /// Returns the square root of the current value.
  ///
  /// - Returns: The square root of the value.
  @inlinable
  public func squareRoot() -> Self {
    return Foundation.sqrt(self)
  }
}
