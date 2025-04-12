//
//  String+Comparison.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Foundation

extension StringProtocol {
  /// Checks if the string is case-insensitively equal to another string.
  ///
  /// Example:
  /// ```swift
  /// let str1 = "Hello"
  /// let str2 = "hello"
  /// print(str1.isCaseInsensitiveEqual(to: str2)) // Output: true
  /// ```
  public func isCaseInsensitiveEqual(to other: String) -> Bool {
    return self.localizedCaseInsensitiveCompare(other) == .orderedSame
  }

  /// Checks if the string contains another string (case-sensitive by default).
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello World"
  /// print(str.contains("World")) // Output: true
  /// print(str.contains("world")) // Output: false
  /// print(str.contains("world", caseSensitive: false)) // Output: true
  /// ```
  public func contains(_ other: String, caseSensitive: Bool = true) -> Bool {
    if caseSensitive {
      return self.range(of: other) != nil
    } else {
      return self.range(of: other, options: .caseInsensitive) != nil
    }
  }

  /// Checks if the string starts with another string (case-sensitive by default).
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello World"
  /// print(str.startsWith("Hello")) // Output: true
  /// print(str.startsWith("hello")) // Output: false
  /// print(str.startsWith("hello", caseSensitive: false)) // Output: true
  /// ```
  public func startsWith(_ prefix: String, caseSensitive: Bool = true) -> Bool {
    if caseSensitive {
      return hasPrefix(prefix)
    } else {
      return lowercased().hasPrefix(prefix.lowercased())
    }
  }

  /// Checks if the string ends with another string (case-sensitive by default).
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello World"
  /// print(str.endsWith("World")) // Output: true
  /// print(str.endsWith("world")) // Output: false
  /// print(str.endsWith("world", caseSensitive: false)) // Output: true
  /// ```
  public func endsWith(_ suffix: String, caseSensitive: Bool = true) -> Bool {
    if caseSensitive {
      return hasSuffix(suffix)
    } else {
      return lowercased().hasSuffix(suffix.lowercased())
    }
  }

  /// Checks if the string is an anagram of another string.
  ///
  /// Example:
  /// ```swift
  /// let str1 = "listen"
  /// let str2 = "silent"
  /// print(str1.isAnagram(of: str2)) // Output: true
  /// let str3 = "hello"
  /// let str4 = "world"
  /// print(str3.isAnagram(of: str4)) // Output: false
  /// ```
  public func isAnagram(of other: String) -> Bool {
    guard self.count == other.count else { return false }
    return self.sorted() == other.sorted()
  }

  /// Compares the string to another string as version numbers (semantic versioning).
  ///
  /// Example:
  /// ```swift
  /// print("1.0.0".compareVersion(to: "1.0.1")) // Output: .orderedAscending
  /// print("1.1.0".compareVersion(to: "1.0.0")) // Output: .orderedDescending
  /// print("1.0.0".compareVersion(to: "1.0.0")) // Output: .orderedSame
  /// ```
  public func compareVersion(to otherVersion: String) -> ComparisonResult {
    return self.compare(otherVersion, options: .numeric)
  }
}
