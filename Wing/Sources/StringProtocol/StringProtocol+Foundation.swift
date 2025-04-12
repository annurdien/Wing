//
//  String+Foundation.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Foundation

extension StringProtocol {
  /// The length of the string.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello"
  /// print(str.length) // Output: 5
  /// ```
  public var length: Int {
    return count
  }

  /// Returns an empty string.
  ///
  /// Example:
  /// ```swift
  /// let empty = String.empty
  /// print(empty.isEmpty) // Output: true
  /// ```
  public static var empty: String {
    return ""
  }

  /// Returns a new string with leading and trailing whitespace and newline characters removed.
  ///
  /// Example:
  /// ```swift
  /// let str = "   Hello, World!   \n"
  /// print(str.trimmed) // Output: "Hello, World!"
  /// ```
  public var trimmed: String {
    return trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
