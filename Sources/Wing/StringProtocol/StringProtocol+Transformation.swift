//
//  String+Transformation.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Foundation

extension StringProtocol {
  /// Returns a new string with diacritic marks removed (e.g., "café" becomes "cafe").
  ///
  /// Example:
  /// ```swift
  /// let str = "café"
  /// print(str.normalized) // Output: "cafe"
  /// ```
  public var normalized: String {
    return self.folding(options: .diacriticInsensitive, locale: .current)
  }

  /// Returns a new string with the first letter uppercased.
  ///
  /// Example:
  /// ```swift
  /// let str = "hello"
  /// print(str.uppercasedFirstLetter) // Output: "Hello"
  /// let alreadyUpper = "World"
  /// print(alreadyUpper.uppercasedFirstLetter) // Output: "World"
  /// ```
  public var uppercasedFirstLetter: String {
    guard !isEmpty else { return String(self) }
    return prefix(1).uppercased() + dropFirst()
  }

  /// Returns a new string with the first letter lowercased.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello"
  /// print(str.lowercasedFirstLetter) // Output: "hello"
  /// let alreadyLower = "world"
  /// print(alreadyLower.lowercasedFirstLetter) // Output: "world"
  /// ```
  public var lowercasedFirstLetter: String {
    guard !isEmpty else { return String(self) }
    return prefix(1).lowercased() + dropFirst()
  }

  /// Converts the string to camel case.
  ///
  /// Example:
  /// ```swift
  /// let str = "hello world example"
  /// print(str.camelCased) // Output: "helloWorldExample"
  /// let alreadyCamel = "thisIsCamelCase"
  /// print(alreadyCamel.camelCased) // Output: "thisIsCamelCase"
  /// ```
  public var camelCased: String {
    guard !isEmpty else { return String(self) }
    let words = components(separatedBy: CharacterSet.alphanumerics.inverted)
      .filter { !$0.isEmpty }
    guard let firstWord = words.first else { return "" }
    if words.count == 1 {
      return firstWord.prefix(1).lowercased() + firstWord.dropFirst()
    }
    let restOfWords = words.dropFirst().map { word -> String in
      guard !word.isEmpty else { return "" }
      let firstChar = word.prefix(1).uppercased()
      let remainingChars = word.dropFirst()
      return firstChar + remainingChars
    }
    return firstWord.lowercased() + restOfWords.joined()
  }

  /// Converts the string to snake case.
  ///
  /// Example:
  /// ```swift
  /// let str = "hello world example"
  /// print(str.snakeCased) // Output: "hello_world_example"
  /// let alreadySnake = "this_is_snake_case"
  /// print(alreadySnake.snakeCased) // Output: "this_is_snake_case"
  /// ```
  public var snakeCased: String {
    guard !isEmpty else { return String(self) }
    let pattern = "[A-Z]([A-Z0-9]+)?(?=$|[A-Z][a-z])|[A-Z]?[a-z]+"
    let regex = try? NSRegularExpression(pattern: pattern, options: [])
    let range = NSRange(location: 0, length: utf16.count)
    return regex?.matches(in: String(self), options: [], range: range)
      .map { (String(self) as NSString).substring(with: $0.range) }
      .joined(separator: "_")
      .lowercased() ?? lowercased()
  }

  /// Converts the string to kebab case.
  ///
  /// Example:
  /// ```swift
  /// let str = "hello world example"
  /// print(str.kebabCased) // Output: "hello-world-example"
  /// let alreadyKebab = "this-is-kebab-case"
  /// print(alreadyKebab.kebabCased) // Output: "this-is-kebab-case"
  /// ```
  public var kebabCased: String {
    return snakeCased.replacingOccurrences(of: "_", with: "-")
  }

  /// Returns the base64 encoded version of the string.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello"
  /// print(str.base64Encoded ?? "") // Output: "SGVsbG8="
  /// ```
  public var base64Encoded: String? {
    return data(using: .utf8)?.base64EncodedString()
  }

  /// Returns the base64 decoded version of the string.
  ///
  /// Example:
  /// ```swift
  /// let encoded = "SGVsbG8="
  /// print(encoded.base64Decoded ?? "") // Output: "Hello"
  /// ```
  public var base64Decoded: String? {
    guard let data = Data(base64Encoded: String(self)) else { return nil }
    return String(data: data, encoding: .utf8)
  }

  /// Returns the reversed string.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello"
  /// print(str.reversed) // Output: "olleH"
  /// ```
  public var reversed: String {
    return String(self.reversed())
  }

  /// Returns a URL encoded version of the string.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello World!"
  /// print(str.urlEncoded ?? "") // Output: "Hello%20World!"
  /// ```
  public var urlEncoded: String? {
    return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
  }

  /// Returns a URL decoded version of the string.
  ///
  /// Example:
  /// ```swift
  /// let encoded = "Hello%20World!"
  /// print(encoded.urlDecoded ?? "") // Output: "Hello World!"
  /// ```
  public var urlDecoded: String? {
    return removingPercentEncoding
  }

  /// Returns a new string with all HTML tags removed.
  ///
  /// Example:
  /// ```swift
  /// let html = "<p>Hello <b>World</b>!</p>"
  /// print(html.removingHTMLTags()) // Output: "Hello World!"
  /// ```
  public func removingHTMLTags() -> String {
    return self.replacingOccurrences(
      of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
  }
}
