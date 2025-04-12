//
//  BinaryFloatingPoint+Conversion.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation
import CoreGraphics

extension BinaryFloatingPoint {
  /// Returns the current value as an integer, truncating any fractional part.
  @inlinable
  public var integer: Int {
    return Int(self)
  }
  
  /// Returns the current value as a `Double`.
  @inlinable
  public var double: Double {
    return Double(self)
  }
  
  /// Returns the current value as a `Float`.
  @inlinable
  public var float: Float {
    return Float(self)
  }
  
  /// Returns the current value as a `CGFloat`.
  @inlinable
  public var cgFloat: CGFloat {
    return CGFloat(self)
  }
}
