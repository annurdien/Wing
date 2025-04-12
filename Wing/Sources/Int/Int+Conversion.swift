//
//  Int+Conversion.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

import CoreGraphics

extension Int {
  /// Returns a `String` representation of the integer.
  ///
  /// Example:
  /// ```swift
  /// let number = 123
  /// let stringRepresentation = number.string // "123"
  /// ```
  public var string: String {
    return String(self)
  }
  
  /// Returns a `CGFloat` representation of the integer.
  ///
  /// `CGFloat` is a floating-point type used in Core Graphics.
  ///
  /// Example:
  /// ```swift
  /// let integerValue = 42
  /// let cgFloatValue = integerValue.cgFloat // 42.0 (as CGFloat)
  /// ```
  public var cgFloat: CGFloat {
    return CGFloat(self)
  }
  
  /// Returns a `Double` representation of the integer.
  ///
  /// `Double` is a high-precision floating-point type.
  ///
  /// Example:
  /// ```swift
  /// let count = 1000
  /// let doubleValue = count.double // 1000.0 (as Double)
  /// ```
  public var double: Double {
    return Double(self)
  }
  
  /// Returns a `Float` representation of the integer.
  ///
  /// `Float` is a single-precision floating-point type.
  ///
  /// Example:
  /// ```swift
  /// let speed = 55
  /// let floatValue = speed.float // 55.0 (as Float)
  /// ```
  public var float: Float {
    return Float(self)
  }
  
  /// Returns a `Bool` representation of the integer.
  ///
  /// The conversion follows the rule that `0` is `false`, and any other integer value (positive or negative) is `true`.
  ///
  /// Example:
  /// ```swift
  /// let zero = 0
  /// let isZeroTrue = zero.bool // false
  ///
  /// let nonZero = 5
  /// let isNonZeroTrue = nonZero.bool // true
  ///
  /// let negativeValue = -10
  /// let isNegativeTrue = negativeValue.bool // true
  /// ```
  public var bool: Bool {
    return self != 0
  }
}
