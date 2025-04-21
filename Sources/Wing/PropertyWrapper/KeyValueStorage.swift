//
//  KeyValueSto.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

import Foundation

/// A property wrapper to simplify access to key-value storage (e.g., UserDefaults).
///
/// This wrapper allows you to easily read and write strongly-typed values to a key-value storage system,
/// such as UserDefaults, with a default value.
///
/// Example:
/// ```swift
/// struct AppSettings {
///     @KeyValueStorage(key: "isLoggedIn", defaultValue: false)
///     static var isLoggedIn: Bool
///
///     @KeyValueStorage(key: "userName", defaultValue: "")
///     static var userName: String
/// }
///
/// // Usage
/// AppSettings.isLoggedIn = true
/// print(AppSettings.userName) // Output: ""
/// ```
@propertyWrapper
struct KeyValueStorage<Value> {
  private let key: String
  private let defaultValue: Value
  
  /// Initializes the property wrapper with a key and a default value.
  ///
  /// - Parameters:
  ///   - key: The key used to store the value in the key-value storage.
  ///   - defaultValue: The default value returned if no value is found for the key.
  ///
  /// Example:
  /// ```swift
  /// @KeyValueStorage(key: "showOnboarding", defaultValue: true)
  /// static var showOnboarding: Bool
  /// ```
  init(key: String, defaultValue: Value) {
    self.key = key
    self.defaultValue = defaultValue
  }
  
  /// The value associated with the key in the key-value storage.
  ///
  /// When set, the value is stored in the key-value storage.
  /// When accessed, the value is retrieved from the key-value storage, or the default value is returned if it does not exist.
  var wrappedValue: Value {
    get {
      UserDefaults.standard.object(forKey: key) as? Value ?? defaultValue
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}

/// A property wrapper to simplify access to key-value storage (e.g., UserDefaults) for `Codable` types.
///
/// This wrapper allows you to easily read and write strongly-typed `Codable` objects to a key-value storage system,
/// such as UserDefaults, with a default value.
///
/// Example:
/// ```swift
/// struct UserProfile: Codable {
///     var name: String
///     var age: Int
/// }
///
/// struct AppSettings {
///     @CodableKeyValueStorage(key: "userProfile", defaultValue: UserProfile(name: "Guest", age: 0))
///     static var userProfile: UserProfile
/// }
///
/// // Usage
/// AppSettings.userProfile = UserProfile(name: "Alice", age: 25)
/// print(AppSettings.userProfile.name) // Output: "Alice"
/// ```
@propertyWrapper
struct CodableKeyValueStorage<Value: Codable> {
  private let key: String
  private let defaultValue: Value
  private let encoder = JSONEncoder()
  private let decoder = JSONDecoder()
  
  /// Initializes the property wrapper with a key and a default value.
  ///
  /// - Parameters:
  ///   - key: The key used to store the value in the key-value storage.
  ///   - defaultValue: The default value returned if no value is found for the key.
  ///
  /// Example:
  /// ```swift
  /// @CodableKeyValueStorage(key: "userProfile", defaultValue: UserProfile(name: "Guest", age: 0))
  /// static var userProfile: UserProfile
  /// ```
  init(key: String, defaultValue: Value) {
    self.key = key
    self.defaultValue = defaultValue
  }
  
  /// The value associated with the key in the key-value storage.
  ///
  /// When set, the value is encoded and stored in the key-value storage.
  /// When accessed, the value is decoded from the key-value storage, or the default value is returned if it does not exist.
  var wrappedValue: Value {
    get {
      guard let data = UserDefaults.standard.data(forKey: key) else {
        return defaultValue
      }
      return (try? decoder.decode(Value.self, from: data)) ?? defaultValue
    }
    set {
      let data = try? encoder.encode(newValue)
      UserDefaults.standard.set(data, forKey: key)
    }
  }
}
