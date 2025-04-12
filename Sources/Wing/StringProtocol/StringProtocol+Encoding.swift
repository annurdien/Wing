//
//  String+Encoding.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Foundation

extension StringProtocol {
  /// Returns a UTF-8 encoded version of the string as `Data`.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello"
  /// if let data = str.utf8Encoded() {
  ///     print(data) // Output: <48656c6c 6f>
  /// }
  /// ```
  public func utf8Encoded() -> Data? {
    return data(using: .utf8)
  }

  /// Returns a UTF-8 decoded version of the string from `Data`.
  ///
  /// Example:
  /// ```swift
  /// let data = Data([72, 101, 108, 108, 111])
  /// print(String.utf8Decoded(data) ?? "") // Output: "Hello"
  /// ```
  public static func utf8Decoded(_ data: Data) -> String? {
    return String(data: data, encoding: .utf8)
  }
}
