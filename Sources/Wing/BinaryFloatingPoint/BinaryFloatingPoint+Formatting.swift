//
//  BinaryFloatingPoint+Formatting.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation

extension BinaryFloatingPoint {
  /// Returns a string representation of the current value formatted to a specified number of decimal places.
  ///
  /// - Parameter fractionDigits: The number of digits after the decimal point.
  /// - Returns: A formatted string representation of the value using `en_US_POSIX` Locale.
  @inlinable
  public func formatted(withFractionDigits fractionDigits: Int) -> String {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = fractionDigits
    formatter.maximumFractionDigits = fractionDigits
    formatter.numberStyle = .decimal
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter.string(for: self) ?? String(describing: self)
  }
}
