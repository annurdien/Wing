//
//  BinaryFloatingPoint+Properties.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension BinaryFloatingPoint {
  /// Returns a Boolean value indicating whether the value is strictly positive (greater than zero).
  @inlinable
  public var isPositive: Bool {
    return self > 0
  }
  
  /// Returns a Boolean value indicating whether the value is strictly negative (less than zero).
  @inlinable
  public var isNegative: Bool {
    return self < 0
  }
}
