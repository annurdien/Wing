//
//  String+Validation.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Foundation

extension StringProtocol {
  /// Checks if the string is a valid email address.
  ///
  /// Example:
  /// ```swift
  /// let email = "test@example.com"
  /// print(email.isValidEmail) // Output: true
  /// let invalidEmail = "test@example"
  /// print(invalidEmail.isValidEmail) // Output: false
  /// ```
  public var isValidEmail: Bool {
    let emailRegex =
      #"(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))"#
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: self)
  }

  /// Checks if the string is a valid URL.
  ///
  /// - Note: Requires `UIKit` import in a UI context.
  ///
  /// Example:
  /// ```swift
  /// let url = "[https://www.example.com](https://www.example.com)"
  /// print(url.isValidURL) // Output: true
  /// let invalidURL = "example"
  /// print(invalidURL.isValidURL) // Output: false
  /// ```
  public var isValidURL: Bool {
    guard !self.isEmpty else { return false }

    // Try to create a URL from the string
    guard let url = URL(string: String(self)) else { return false }

    // Verify the URL has at least a scheme and host
    guard let scheme = url.scheme, let host = url.host else { return false }

    // List of common valid URL schemes
    let validSchemes = [
      // Web protocols
      "http", "https",
      // File transfer
      "ftp", "ftps", "sftp",
      // Email
      "mailto",
      // File
      "file",
      // Secure shell
      "ssh",
      // Media streaming
      "rtsp", "rtmp", "rtp",
      // Telephone
      "tel", "sms",
      // Messaging
      "xmpp", "irc",
      // VoIP
      "sip", "sips",
      // Version control
      "git", "svn",
      // Remote access
      "vnc", "rdp",
      // Database
      "jdbc", "odbc", "postgres", "mysql", "mongodb",
      // App-specific
      "facetime", "skype", "whatsapp", "telegram", "slack", "discord",
      // Blockchain
      "bitcoin", "ethereum",
      // Cloud storage
      "dropbox", "onedrive", "gdrive",
      // Maps and location
      "geo", "maps",
      // App deep linking
      "appscheme", "itms", "itms-apps",
      // Feed protocols
      "feed", "rss", "atom",
      // Data serialization
      "data",
      // WebSocket
      "ws", "wss",
      // Gopher
      "gopher",
      // IPFS
      "ipfs", "ipns",
      // News
      "news", "nntp",
    ]

    guard validSchemes.contains(scheme.lowercased()) else { return false }

    // Ensure host has at least one period (e.g., example.com) for http/https schemes
    // For other schemes, this requirement might not be relevant
    let webSchemes = ["http", "https", "ftp", "ftps"]
    if webSchemes.contains(scheme.lowercased()) && !host.contains(".") {
      return false
    }

    return true
  }

  /// Checks if the string is a valid URL and allow custom schemes
  /// - Parameter customSchemes: Additional URL schemes to consider valid
  /// - Returns: Boolean indicating if the string is a valid URL
  public func isValidURL(additionalSchemes: [String] = []) -> Bool {
    // Check if string is empty
    guard !self.isEmpty else { return false }

    // Try to create a URL from the string
    guard let url = URL(string: String(self)) else { return false }

    // Verify the URL has at least a scheme and host
    guard let scheme = url.scheme else { return false }

    // Common valid URL schemes
    let validSchemes =
      [
        "http", "https", "ftp", "ftps", "sftp", "mailto", "file", "ssh",
        "rtsp", "rtmp", "rtp", "tel", "sms", "xmpp", "irc", "sip", "sips",
        "git", "svn", "vnc", "rdp", "jdbc", "odbc", "postgres", "mysql", "mongodb",
        "facetime", "skype", "whatsapp", "telegram", "slack", "discord",
        "bitcoin", "ethereum", "dropbox", "onedrive", "gdrive",
        "geo", "maps", "appscheme", "itms", "itms-apps",
        "feed", "rss", "atom", "data", "ws", "wss", "gopher", "ipfs", "ipns",
        "news", "nntp",
      ] + additionalSchemes

    guard validSchemes.contains(scheme.lowercased()) else { return false }

    // For http/https schemes, require host with a period
    let webSchemes = ["http", "https", "ftp", "ftps"]
    if webSchemes.contains(scheme.lowercased()) {
      guard let host = url.host, host.contains(".") else { return false }
    }

    return true
  }

  /// Checks if the string is a valid phone number (basic format allowing digits, +, -, space, (, )).
  ///
  /// Example:
  /// ```swift
  /// let phone = "+1 (555) 123-4567"
  /// print(phone.isPhoneNumber) // Output: true
  /// let invalidPhone = "abc"
  /// print(invalidPhone.isPhoneNumber) // Output: false
  /// ```
  public var isPhoneNumber: Bool {
    let phoneRegex = "^[0-9\\+\\-\\s()]*$"
    let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
    return phonePredicate.evaluate(with: self)
  }

  /// Checks if the string contains only alphanumeric characters.
  ///
  /// Example:
  /// ```swift
  /// let alphaNumeric = "HelloWorld123"
  /// print(alphaNumeric.isAlphanumeric) // Output: true
  /// let withSpace = "Hello World"
  /// print(withSpace.isAlphanumeric) // Output: false
  /// ```
  public var isAlphanumeric: Bool {
    return !isEmpty && rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil
  }

  /// Checks if the string contains only numeric characters.
  ///
  /// Example:
  /// ```swift
  /// let numeric = "12345"
  /// print(numeric.isNumeric) // Output: true
  /// let withLetter = "123a"
  /// print(withLetter.isNumeric) // Output: false
  /// ```
  public var isNumeric: Bool {
    return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
  }

  /// Checks if the string contains only alphabetic characters.
  ///
  /// Example:
  /// ```swift
  /// let alphabetic = "HelloWorld"
  /// print(alphabetic.isAlphabetic) // Output: true
  /// let withNumber = "Hello1"
  /// print(withNumber.isAlphabetic) // Output: false
  /// ```
  public var isAlphabetic: Bool {
    return !isEmpty && rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
  }

  /// Checks if the string contains only characters from a given set.
  ///
  /// Example:
  /// ```swift
  /// let hexChars = CharacterSet(charactersIn: "0123456789abcdefABCDEF")
  /// let hexString = "A1B2C3D4"
  /// print(hexString.containsOnlyCharactersIn(characterSet: hexChars)) // Output: true
  /// let nonHexString = "A1B2G3D4"
  /// print(nonHexString.containsOnlyCharactersIn(characterSet: hexChars)) // Output: false
  /// ```
  public func containsOnlyCharactersIn(characterSet: CharacterSet) -> Bool {
    return rangeOfCharacter(from: characterSet.inverted) == nil
  }

  /// Checks if the string is a strong password (minimum 8 characters, at least one uppercase, one lowercase, and one number).
  ///
  /// Example:
  /// ```swift
  /// let strongPass = "P@sswOrd123"
  /// print(strongPass.isStrongPassword) // Output: true
  /// let weakPass = "password"
  /// print(weakPass.isStrongPassword) // Output: false
  /// ```
  public var isStrongPassword: Bool {
    guard count >= 8 else { return false }
    let uppercaseRegex = ".*[A-Z]+.*"
    let lowercaseRegex = ".*[a-z]+.*"
    let numbersRegex = ".*[0-9]+.*"
    let uppercaseTest = NSPredicate(format: "SELF MATCHES %@", uppercaseRegex)
    let lowercaseTest = NSPredicate(format: "SELF MATCHES %@", lowercaseRegex)
    let numbersTest = NSPredicate(format: "SELF MATCHES %@", numbersRegex)
    return uppercaseTest.evaluate(with: self) && lowercaseTest.evaluate(with: self)
      && numbersTest.evaluate(with: self)
  }

  /// Checks if the string is a valid hexadecimal string.
  ///
  /// Example:
  /// ```swift
  /// let hex = "A1B2C3"
  /// print(hex.isHexadecimal) // Output: true
  /// let nonHex = "A1B2G3"
  /// print(nonHex.isHexadecimal) // Output: false
  /// ```
  public var isHexadecimal: Bool {
    let hexChars = CharacterSet(charactersIn: "0123456789abcdefABCDEF")
    return containsOnlyCharactersIn(characterSet: hexChars)
  }

  /// Checks if the string is a valid IP address (IPv4).
  ///
  /// Example:
  /// ```swift
  /// let ip = "192.168.1.1"
  /// print(ip.isValidIPAddress) // Output: true
  /// let invalidIP = "256.0.0.1"
  /// print(invalidIP.isValidIPAddress) // Output: false
  /// ```
  public var isValidIPAddress: Bool {
    let parts = self.components(separatedBy: ".")
    guard parts.count == 4 else { return false }
    return parts.allSatisfy { part in
      guard let value = Int(part), 0...255 ~= value else { return false }
      return true
    }
  }

  /// Checks if the string is a valid postal code (US format: 5 digits or 5 digits followed by a hyphen and 4 digits).
  ///
  /// Example:
  /// ```swift
  /// let zip1 = "12345"
  /// print(zip1.isValidPostalCode) // Output: true
  /// let zip2 = "12345-6789"
  /// print(zip2.isValidPostalCode) // Output: true
  /// let invalidZip = "1234"
  /// print(invalidZip.isValidPostalCode) // Output: false
  /// ```
  public var isValidPostalCode: Bool {
    let postalCodeRegex = "^\\d{5}(-\\d{4})?$"
    let postalCodePredicate = NSPredicate(format: "SELF MATCHES %@", postalCodeRegex)
    return postalCodePredicate.evaluate(with: self)
  }
}
