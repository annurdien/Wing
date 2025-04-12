//
//  Int+Basic.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

extension BinaryInteger {
  /// A boolean value indicating whether the instance is even
  public var isEven: Bool {
    return self % 2 == 0
  }
  
  /// A boolean value indicating whether the instance is odd
  public var isOdd: Bool {
    return !isEven
  }
  
  /// A boolean value indicating whether the instance is positive
  public var isPositive: Bool {
    return self > 0
  }
  
  /// A boolean value indicating whether the instance is negative (less than 0)
  public var isNegative: Bool {
    return self < 0
  }
}
