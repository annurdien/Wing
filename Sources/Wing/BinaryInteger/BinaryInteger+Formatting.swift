//
//  Int+Formatting.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

import Foundation

extension BinaryInteger {
  /// Returns a formatted string representation of the integer using the specified number style.
  ///
  /// ```swift
  /// let formattedNumber = 12345.formatted(withStyle: .currency) // "$12,345.00" (depending on locale)
  /// ```
  ///
  /// - Parameter style: The `NumberFormatter.Style` to use for formatting.
  /// - Returns: A formatted string representation of the integer, or `nil` if formatting fails.
  public func formatted(withStyle style: NumberFormatter.Style) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = style
    return formatter.string(from: NSNumber(value: Int(self)))
  }
  
  /// Returns a currency formatted string representation of the integer for the given locale.
  ///
  /// Example:
  /// ```swift
  /// let price = 1500
  /// let usCurrency = price.currencyFormatted(locale: Locale(identifier: "en_US")) // "$1,500.00"
  /// let germanCurrency = price.currencyFormatted(locale: Locale(identifier: "de_DE")) // "1.500,00 €"
  /// ```
  ///
  /// - Parameter locale: The `Locale` to use for formatting the currency. Defaults to the current locale.
  /// - Returns: A currency formatted string, or `nil` if formatting fails.
  public func currencyFormatted(locale: Locale = .current) -> String? {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    numberFormatter.locale = locale
    return numberFormatter.string(from: NSNumber(value: Int(self)))
  }
}
