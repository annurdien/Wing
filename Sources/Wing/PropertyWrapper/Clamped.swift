//
//  Clamped.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

import Foundation

/// A property wrapper that ensures a value stays within a specified range.
@propertyWrapper
struct Clamped<Value: Comparable> {
  private var value: Value
  private let range: ClosedRange<Value>
  
  /// The clamped value.
  var wrappedValue: Value {
    get { value }
    set { value = min(max(newValue, range.lowerBound), range.upperBound) }
  }
  
  /// Initializes the wrapper with an initial value and a range.
  ///
  /// - Parameters:
  ///   - wrappedValue: The initial value.
  ///   - range: The range within which the value must stay.
  ///
  /// Example:
  /// ```swift
  /// @Clamped(0...100) var progress: Int = 120
  /// print(progress) // Output: 100
  /// ```
  init(wrappedValue: Value, _ range: ClosedRange<Value>) {
    self.value = min(max(wrappedValue, range.lowerBound), range.upperBound)
    self.range = range
  }
}
