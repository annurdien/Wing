//
//  Optional+Extensions.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

import Foundation

extension Optional {
  /// Executes a closure if the Optional contains a value.
  ///
  /// Use this method to perform an action only when the optional has a non-nil value.
  /// - Parameter action: A closure that takes the unwrapped value of the optional.
  ///
  /// Example:
  /// ```swift
  /// let value: Int? = 42
  /// value.ifPresent { print("The value is \($0)") }
  /// // Prints: The value is 42
  /// ```
  public func ifPresent(_ action: (Wrapped) -> Void) {
    if let value = self {
      action(value)
    }
  }

  /// Executes one of two closures depending on whether the Optional is `nil` or contains a value.
  ///
  /// Use this method to handle both cases of an optional: when it has a value or when it is `nil`.
  /// - Parameters:
  ///   - ifPresent: A closure that takes the unwrapped value of the optional.
  ///   - ifNil: A closure executed when the optional is `nil`.
  ///
  /// Example:
  /// ```swift
  /// let value: String? = nil
  /// value.ifPresent({ print("Value: \($0)") }, ifNil: { print("No value") })
  /// // Prints: No value
  /// ```
  public func ifPresent(_ ifPresent: (Wrapped) -> Void, ifNil: () -> Void) {
    if let value = self {
      ifPresent(value)
    } else {
      ifNil()
    }
  }

  /// Returns the value of the Optional or a default value if it's `nil`.
  ///
  /// Use this method to provide a fallback value for an optional.
  /// - Parameter defaultValue: The default value to return if the optional is `nil`.
  /// - Returns: The unwrapped value of the optional or the provided default value.
  ///
  /// Example:
  /// ```swift
  /// let value: Int? = nil
  /// let result = value.or(10)
  /// print(result) // Prints: 10
  /// ```
  public func or(_ defaultValue: Wrapped) -> Wrapped {
    return self ?? defaultValue
  }

  /// Transforms the value of the Optional if it exists, otherwise returns `nil`.
  ///
  /// Use this method to safely transform the value of an optional using a closure.
  /// - Parameter transform: A closure that takes the unwrapped value of the optional and returns a transformed value.
  /// - Returns: The transformed value or `nil`.
  ///
  /// Example:
  /// ```swift
  /// let value: Int? = 5
  /// let result = value.mapOptional { $0 * 2 }
  /// print(result) // Prints: Optional(10)
  /// ```
  public func mapOptional<T>(_ transform: (Wrapped) -> T?) -> T? {
    if let value = self {
      return transform(value)
    }
    return nil
  }

  /// Unwraps the Optional or throws a custom error if it's `nil`.
  ///
  /// Use this method when you want to ensure an optional has a value or explicitly handle the error case.
  /// - Parameter error: The custom error to throw if the optional is `nil`.
  /// - Throws: The provided custom error.
  /// - Returns: The unwrapped value of the optional.
  ///
  /// Example:
  /// ```swift
  /// enum MyError: Error {
  ///     case missingValue
  /// }
  ///
  /// let value: Int? = nil
  /// do {
  ///     let result = try value.orThrow(MyError.missingValue)
  /// } catch {
  ///     print(error) // Prints: missingValue
  /// }
  /// ```
  public func orThrow(_ error: @autoclosure () -> Error) throws -> Wrapped {
    guard let value = self else {
      throw error()
    }
    return value
  }

  /// Executes the given closure with the unwrapped value if the optional is not `nil`.
  ///
  /// - Parameter action: A closure that takes the unwrapped value as its argument.
  @inlinable
  public func ifLet(_ action: (Wrapped) throws -> Void) rethrows {
    switch self {
    case .some(let value):
      try action(value)
    case .none:
      break
    }
  }

  /// Maps the wrapped value using the given closure if the optional is not `nil`, otherwise returns `nil`.
  ///
  /// - Parameter transform: A closure that takes the unwrapped value and returns a new optional value.
  /// - Returns: The result of the `transform` closure if the optional has a value, otherwise `nil`.
  @inlinable
  public func mapIfPresent<U>(_ transform: (Wrapped) throws -> U) rethrows -> U? {
    switch self {
    case .some(let value):
      return try transform(value)
    case .none:
      return nil
    }
  }

  /// Flat-maps the wrapped value using the given closure if the optional is not `nil`, otherwise returns `nil`.
  ///
  /// - Parameter transform: A closure that takes the unwrapped value and returns a new optional value.
  /// - Returns: The result of the `transform` closure if the optional has a value, otherwise `nil`.
  @inlinable
  public func flatMapIfPresent<U>(_ transform: (Wrapped) throws -> U?) rethrows -> U? {
    switch self {
    case .some(let value):
      return try transform(value)
    case .none:
      return nil
    }
  }
}
