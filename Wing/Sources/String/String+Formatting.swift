//
//  String+Formatting.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Foundation

extension String {
  /// Formats the string as a currency string using the specified locale.
  ///
  /// Example:
  /// ```swift
  /// let price = "1234.56"
  /// if let formattedPrice = price.formatCurrency() {
  ///     print(formattedPrice) // Output: (Formatted currency string based on current locale)
  /// }
  /// if let formattedPriceUS = price.formatCurrency(locale: Locale(identifier: "en_US")) {
  ///     print(formattedPriceUS) // Output: "$1,234.56"
  /// }
  /// ```
  public func formatCurrency(locale: Locale = .current) -> String? {
    guard let value = Double(self) else { return nil }
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = locale
    return formatter.string(from: NSNumber(value: value))
  }

  /// Formats the string as a number with a specified number of decimal places.
  ///
  /// Example:
  /// ```swift
  /// let number = "123.4567"
  /// print(number.formatNumber(decimalPlaces: 2)) // Output: "123.46"
  /// ```
  public func formatNumber(decimalPlaces: Int, locale: Locale = .current) -> String? {
    guard let value = Double(self) else { return nil }
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.locale = locale
    formatter.maximumFractionDigits = decimalPlaces
    formatter.minimumFractionDigits = decimalPlaces
    return formatter.string(from: NSNumber(value: value))
  }

  /// Formats the string as a percentage string.
  ///
  /// Example:
  /// ```swift
  /// let ratio = "0.75"
  /// print(ratio.formatPercentage()) // Output: "75%"
  /// ```
  public func formatPercentage() -> String? {
    guard let value = Double(self) else { return nil }
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    return formatter.string(from: NSNumber(value: value))
  }
}
