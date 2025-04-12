//
//  Int+TimeInterval.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension Int {
  /// Returns a `TimeInterval` representing the integer as seconds.
  public var seconds: TimeInterval {
    return TimeInterval(self)
  }
  
  /// Returns a `TimeInterval` representing the integer as minutes.
  public var minutes: TimeInterval {
    return TimeInterval(self * 60)
  }
  
  /// Returns a `TimeInterval` representing the integer as hours.
  public var hours: TimeInterval {
    return TimeInterval(self * 60 * 60)
  }
  
  /// Returns a `TimeInterval` representing the integer as days.
  public var days: TimeInterval {
    return TimeInterval(self * 60 * 60 * 24)
  }
}
