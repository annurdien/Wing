//
//  Masked.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

/// Securely displays sensitive information (e.g., credit cards, SSNs) while maintaining the actual data.
/// - Customizable masking patterns and replacement characters.
/// - Provides access to the original unmasked data when needed.
///
/// Example:
/// ```swift
/// struct Example {
///     @Masked(maskCharacter: "*", revealCount: 4) var creditCard: String = "1234567812345678"
/// }
/// let example = Example()
/// print(example.creditCard) // Output: ************5678
/// print(example.$creditCard) // Output: 1234567812345678
/// ```
@propertyWrapper
struct Masked {
  private var value: String
  private let maskCharacter: Character
  private let revealCount: Int
  
  var wrappedValue: String {
    get { String(repeating: maskCharacter, count: max(0, value.count - revealCount)) + value.suffix(revealCount) }
    set { value = newValue }
  }
  
  var projectedValue: String { value }
  
  init(wrappedValue: String, maskCharacter: Character = "*", revealCount: Int = 4) {
    self.value = wrappedValue
    self.maskCharacter = maskCharacter
    self.revealCount = revealCount
  }
}
