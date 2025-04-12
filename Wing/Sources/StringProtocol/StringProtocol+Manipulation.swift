//
//  String+Manipulation.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Foundation

extension StringProtocol {
  /// Returns a substring starting from a given index.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello, World!"
  /// print(str.substring(from: 7)) // Output: "World!"
  /// ```
  public func substring(from index: Int) -> String {
    guard index >= 0, index < count else { return "" }
    return String(self[self.index(startIndex, offsetBy: index)...])
  }

  /// Returns a substring ending at a given index (exclusive).
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello, World!"
  /// print(str.substring(to: 5)) // Output: "Hello"
  /// ```
  public func substring(to index: Int) -> String {
    guard index >= 0, index <= count else { return "" }
    return String(self[..<self.index(startIndex, offsetBy: index)])
  }

  /// Returns a new string with all occurrences of a substring replaced.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello World World"
  /// print(str.replacing("World", with: "Universe")) // Output: "Hello Universe Universe"
  /// ```
  public func replacing(_ target: String, with replacement: String) -> String {
    return replacingOccurrences(of: target, with: replacement)
  }

  /// Returns a new string with all occurrences of a substring removed.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello World World"
  /// print(str.removing("World ")) // Output: "HelloWorld"
  /// ```
  public func removing(_ target: String) -> String {
    return replacingOccurrences(of: target, with: "")
  }

  /// Returns a new string with another string appended.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello"
  /// print(str.appending(" World!")) // Output: "Hello World!"
  /// ```
  public func appending(_ other: String) -> String {
    return self + other
  }

  /// Returns a new string with another string inserted at a given index.
  ///
  /// Example:
  /// ```swift
  /// let str = "HelloWorld"
  /// print(str.inserting(", ", at: 5)) // Output: "Hello, World"
  /// ```
  public func inserting(_ string: String, at index: Int) -> String {
    guard index >= 0, index <= count else { return String(self) }
    return String(prefix(index)) + string + String(suffix(count - index))
  }

  /// Pads the string to a specified length by appending a padding character at the end.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello"
  /// print(str.padding(toLength: 10, withPad: "*")) // Output: "Hello*****"
  /// ```
  public func padding(toLength length: Int, withPad pad: String) -> String {
    return padding(toLength: length, withPad: pad, startingAt: 0)
  }

  /// Truncates the string to a specified length, optionally adding an ellipsis.
  ///
  /// Example:
  /// ```swift
  /// let str = "This is a long string."
  /// print(str.truncate(length: 10)) // Output: "This is a ..."
  /// print(str.truncate(length: 10, addEllipsis: false)) // Output: "This is a "
  /// ```
  public func truncate(length: Int, addEllipsis: Bool = true) -> String {
    guard count > length else { return String(self) }
    let trimmedString = String(prefix(length))
    return addEllipsis ? "\(trimmedString)..." : trimmedString
  }

  /// Finds the index of the nth occurrence of a substring.
  ///
  /// Example:
  /// ```swift
  /// let str = "banana"
  /// if let index = str.indexOf(sub: "a", occurrence: 2) {
  ///     print(index) // Output: 3
  /// }
  /// ```
  public func indexOf(sub: String, occurrence: Int) -> Int? {
    guard occurrence > 0 else { return nil }
    var currentCount = 0
    var currentIndex = startIndex
    while let range = self[currentIndex...].range(of: sub) {
      currentCount += 1
      if currentCount == occurrence {
        return distance(from: startIndex, to: range.lowerBound)
      }
      currentIndex = range.upperBound
    }
    return nil
  }
}
