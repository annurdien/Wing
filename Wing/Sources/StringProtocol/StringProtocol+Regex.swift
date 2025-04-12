//
//  String+Regex.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Foundation

extension StringProtocol {
  /// Checks if the string matches a given regular expression.
  ///
  /// - Parameter regex: The regular expression pattern to match against.
  ///
  /// Example:
  /// ```swift
  /// let str = "123-456-7890"
  /// let phoneRegex = "^\\d{3}-\\d{3}-\\d{4}$"
  /// print(str.matches(regex: phoneRegex)) // Output: true
  /// ```
  public func matches(regex: String) -> Bool {
    return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
  }

  /// Returns all substrings that match a given regular expression.
  ///
  /// - Parameter regex: The regular expression pattern to find matches for.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello 123 World 456"
  /// let numberRegex = "\\d+"
  /// print(str.matchingStrings(regex: numberRegex)) // Output: ["123", "456"]
  /// ```
  public func matchingStrings(regex: String) -> [String] {
    guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return [] }
    let nsString = String(self) as NSString
    let results = regex.matches(
      in: String(self), options: [], range: NSRange(location: 0, length: nsString.length))
    return results.map { nsString.substring(with: $0.range) }
  }

  /// Replaces all occurrences matching a regular expression with a given string.
  ///
  /// - Parameters:
  ///   - regex: The regular expression pattern to match.
  ///   - replacement: The string to replace the matches with.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello 123 World 456"
  /// let numberRegex = "\\d+"
  /// print(str.replacingOccurrences(ofRegex: numberRegex, with: "***")) // Output: "Hello *** World ***"
  /// ```
  public func replacingOccurrences(ofRegex regex: String, with replacement: String) -> String {
    guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return String(self) }
    let nsString = String(self) as NSString
    let range = NSRange(location: 0, length: nsString.length)
    return regex.stringByReplacingMatches(
      in: String(self), options: [], range: range, withTemplate: replacement)
  }
}
