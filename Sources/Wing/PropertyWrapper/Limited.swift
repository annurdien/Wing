//
//  Limited.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

/// Prevents string overflow by enforcing a maximum length.
/// - Configurable truncation strategy (from beginning or end).
/// - Projected value indicates if there's space remaining.
///
/// Example:
/// ```swift
/// struct Example {
///     @LimitedLength(maxLength: 10) var description: String = "A very long string that will be truncated."
/// }
/// let example = Example()
/// print(example.description) // Output: "A very long"
/// print(example.$description) // Output: true
/// ```
@propertyWrapper
struct LimitedLength {
  private var value: String
  private let maxLength: Int
  private let truncateFromEnd: Bool
  
  var wrappedValue: String {
    get { value }
    set { value = truncateFromEnd ? String(newValue.prefix(maxLength)) : String(newValue.suffix(maxLength)) }
  }
  
  var projectedValue: Bool { value.count < maxLength }
  
  init(wrappedValue: String, maxLength: Int, truncateFromEnd: Bool = true) {
    self.value = wrappedValue
    self.maxLength = maxLength
    self.truncateFromEnd = truncateFromEnd
  }
}
