//
//  Trimming.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

import Foundation

/// A property wrapper that trims whitespace and newlines from string values.
@propertyWrapper
struct Trimming {
  private var value: String
  
  /// The trimmed string value.
  var wrappedValue: String {
    get { value }
    set { value = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
  }
  
  /// Initializes the wrapper with an initial value.
  ///
  /// - Parameter wrappedValue: The initial value of the property.
  ///
  /// Example:
  /// ```swift
  /// @Trimming var name: String = " John Doe "
  /// ```
  init(wrappedValue: String) {
    self.value = wrappedValue.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
