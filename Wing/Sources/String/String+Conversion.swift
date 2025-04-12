//
//  String+Conversion.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Foundation

extension String {
  /// Converts the string to an `Int`.
  ///
  /// Example:
  /// ```swift
  /// let str = "123"
  /// print(str.int ?? 0) // Output: 123
  /// let invalid = "abc"
  /// print(invalid.int) // Output: nil
  /// ```
  public var int: Int? {
    return Int(self)
  }

  /// Converts the string to a `Double`.
  ///
  /// Example:
  /// ```swift
  /// let str = "3.14"
  /// print(str.double ?? 0.0) // Output: 3.14
  /// let invalid = "abc"
  /// print(invalid.double) // Output: nil
  /// ```
  public var double: Double? {
    return Double(self)
  }

  /// Converts the string to a `Float`.
  ///
  /// Example:
  /// ```swift
  /// let str = "2.718"
  /// print(str.float ?? 0.0) // Output: 2.718
  /// let invalid = "abc"
  /// print(invalid.float) // Output: nil
  /// ```
  public var float: Float? {
    return Float(self)
  }

  /// Converts the string to a `Bool` (considering "true", "false", "yes", "no", "1", "0" - case-insensitive).
  ///
  /// Example:
  /// ```swift
  /// print("true".bool ?? false) // Output: true
  /// print("no".bool ?? true)   // Output: false
  /// print("1".bool ?? false)    // Output: true
  /// print("invalid".bool)      // Output: nil
  /// ```
  public var bool: Bool? {
    let lowercased = self.lowercased()
    if lowercased == "true" || lowercased == "yes" || lowercased == "1" {
      return true
    } else if lowercased == "false" || lowercased == "no" || lowercased == "0" {
      return false
    }
    return nil
  }

  /// Converts the string to a `Date` using the specified format.
  ///
  /// Example:
  /// ```swift
  /// let dateString = "2023-10-27"
  /// let dateFormatter = "yyyy-MM-dd"
  /// if let date = dateString.date(withFormat: dateFormatter) {
  ///     print(date) // Output: 2023-10-27 00:00:00 +0000
  /// }
  /// ```
  public func date(withFormat format: String, locale: Locale = Locale(identifier: "en_US_POSIX"))
    -> Date?
  {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = locale
    return dateFormatter.date(from: self)
  }

  /// Converts the string to `Data` using UTF-8 encoding.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello"
  /// if let data = str.utf8Data {
  ///     print(data) // Output: <48656c6c 6f>
  /// }
  /// ```
  public var utf8Data: Data? {
    return data(using: .utf8)
  }

  /// Converts the string to an array of integers (splitting by comma by default).
  ///
  /// Example:
  /// ```swift
  /// let str = "1,2,3,4,5"
  /// print(str.toIntArray()) // Output: [1, 2, 3, 4, 5]
  /// let strWithSpaces = "1, 2, 3"
  /// print(strWithSpaces.toIntArray()) // Output: [1, 2, 3]
  /// ```
  public func toIntArray(separatedBy separator: String = ",") -> [Int] {
    return components(separatedBy: separator)
      .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
      .compactMap { Int($0) }
  }

  /// Converts the string to an array of doubles (splitting by comma by default).
  ///
  /// Example:
  /// ```swift
  /// let str = "1.1,2.2,3.3"
  /// print(str.toDoubleArray()) // Output: [1.1, 2.2, 3.3]
  /// ```
  public func toDoubleArray(separatedBy separator: String = ",") -> [Double] {
    return components(separatedBy: separator)
      .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
      .compactMap { Double($0) }
  }

  /// Converts the string to a `URL`.
  ///
  /// Example:
  /// ```swift
  /// let urlString = "[https://www.example.com](https://www.example.com)"
  /// if let url = urlString.toURL() {
  ///     print(url) // Output: [https://www.example.com](https://www.example.com)
  /// }
  /// ```
  public func toURL() -> URL? {
    guard isValidURL else { return nil }
    return URL(string: self)
  }

  /// Converts the string to `Data` using a specified encoding.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello"
  /// if let data = str.toData(using: .ascii) {
  ///     print(data) // Output: <48656c6c 6f>
  /// }
  /// ```
  public func toData(using encoding: String.Encoding) -> Data? {
    return data(using: encoding)
  }
}
