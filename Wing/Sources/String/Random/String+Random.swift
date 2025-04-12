//
//  String+Random.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Foundation

extension String {
  /// Generates a random string of a given length using alphanumeric characters.
  ///
  /// Example:
  /// ```swift
  /// print(String.random(length: 10)) // Output: (A random 10-character alphanumeric string)
  /// ```
  public static func random(length: Int) -> String {
    let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map { _ in allowedChars.randomElement()! })
  }

  /// Generates a random string of a given length using only alphabetic characters.
  ///
  /// Example:
  /// ```swift
  /// print(String.randomAlphabetic(length: 8)) // Output: (A random 8-character alphabetic string)
  /// ```
  public static func randomAlphabetic(length: Int) -> String {
    let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return String((0..<length).map { _ in allowedChars.randomElement()! })
  }

  /// Generates a random string of a given length using only numeric characters.
  ///
  /// Example:
  /// ```swift
  /// print(String.randomNumeric(length: 6)) // Output: (A random 6-digit numeric string)
  /// ```
  public static func randomNumeric(length: Int) -> String {
    let allowedChars = "0123456789"
    return String((0..<length).map { _ in allowedChars.randomElement()! })
  }

  /// Generates a random string of a given length using a custom set of characters.
  ///
  /// Example:
  /// ```swift
  /// let customChars = "!@#%^&*"
  /// print(String.random(length: 5, from: customChars)) // Output: (A random 5-character string using customChars)
  /// ```
  public static func random(length: Int, from characters: String) -> String {
    guard !characters.isEmpty else { return "" }
    return String((0..<length).map { _ in characters.randomElement()! })
  }
}
