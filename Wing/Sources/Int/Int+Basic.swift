//
//  Int+Basic.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

extension Int {
  /// Returns `true` if the integer is even, `false` otherwise.
  public var isEven: Bool {
    return self % 2 == 0
  }
  
  /// Returns `true` if the integer is odd, `false` otherwise.
  public var isOdd: Bool {
    return !isEven
  }
  
  /// Returns `true` if the integer is positive (greater than 0), `false` otherwise.
  public var isPositive: Bool {
    return self > 0
  }
  
  /// Returns `true` if the integer is negative (less than 0), `false` otherwise.
  public var isNegative: Bool {
    return self < 0
  }
  
  /// Returns `true` if the integer is zero, `false` otherwise.
  public var isZero: Bool {
    return self == 0
  }
  
  /// Returns the absolute value of the integer.
  public var absoluteValue: Int {
    return Swift.abs(self)
  }
}
