//
//  BinaryFloatingPoint+TimeInterval.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension BinaryFloatingPoint {
  /// A `TimeInterval` value representing the floating-point number as seconds.
  @inlinable
  public var seconds: TimeInterval {
    return TimeInterval(self)
  }
  
  /// A `TimeInterval` value  representing the floating-point number as minutes.
  @inlinable
  public var minutes: TimeInterval {
    return TimeInterval(self * 60)
  }
  
  /// A `TimeInterval` value  representing the floating-point number as hours.
  @inlinable
  public var hours: TimeInterval {
    return TimeInterval(self * 60 * 60)
  }
  
  /// A `TimeInterval` value` representing the floating-point number as days.
  @inlinable
  public var days: TimeInterval {
    return TimeInterval(self * 60 * 60 * 24)
  }
}
