//
//  BinaryFloatingPoint+Rounding.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension BinaryFloatingPoint {
  /// Returns the result of rounding the current value to the nearest integer.
  ///
  /// - Returns: The nearest integer to the current value.
  @inlinable
  public func rounded() -> Self {
    return Foundation.round(self)
  }
  
  /// Returns the result of rounding the current value to a specified number of decimal places.
  ///
  /// - Parameter places: The number of decimal places to round to.
  /// - Returns: The rounded value.
  @inlinable
  public func rounded(toPlaces places: Int) -> Self {
    let divisor = Self(pow(10.0, Double(places)))
    return (self * divisor).rounded() / divisor
  }
  
  /// Returns the result of rounding the current value down to the nearest integer.
  ///
  /// - Returns: The largest integer less than or equal to the current value.
  @inlinable
  public func floor() -> Self {
    return Foundation.floor(self)
  }
  
  /// Returns the result of rounding the current value up to the nearest integer.
  ///
  /// - Returns: The smallest integer greater than or equal to the current value.
  @inlinable
  public func ceil() -> Self {
    return Foundation.ceil(self)
  }
}
