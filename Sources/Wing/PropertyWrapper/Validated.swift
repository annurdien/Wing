//
//  Validator.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

/// Applies custom validation rules to properties.
/// - Preserves the previous valid value when validation fails.
/// - Provides validation status and error messages via projected value.
///
/// Example:
/// ```swift
/// struct Example {
///     @Validated(validationRule: { $0.count >= 6 }, errorMessage: "Password must be at least 6 characters") var password: String = ""
/// }
/// var example = Example()
/// example.password = "123"
/// print(example.$password) // Output: (false, "Password must be at least 6 characters")
/// example.password = "123456"
/// print(example.$password) // Output: (true, nil)
/// ```
@propertyWrapper
struct Validated {
  private var value: String
  private let validationRule: (String) -> Bool
  private let errorMessage: String
  private var lastValidValue: String = ""
  
  var wrappedValue: String {
    get { value }
    set {
      if validationRule(newValue) {
        value = newValue
        lastValidValue = newValue
      }
    }
  }
  
  var projectedValue: (isValid: Bool, error: String?) {
    (validationRule(value), validationRule(value) ? nil : errorMessage)
  }
  
  init(wrappedValue: String, validationRule: @escaping (String) -> Bool, errorMessage: String = "Invalid value") {
    self.value = wrappedValue
    self.validationRule = validationRule
    self.errorMessage = errorMessage
  }
}
