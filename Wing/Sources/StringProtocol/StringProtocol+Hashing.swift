//
//  String+Hashing.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import CommonCrypto
import Foundation

extension StringProtocol {
  /// Returns the SHA1 hash of the string.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello"
  /// print(str.sha1()) // Output: "f7ff9e8b7bb2e09b70935a5d785e0cc5d9d0abf0"
  /// ```
  public func sha1() -> String {
    guard let data = data(using: .utf8) else { return "" }
    var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
    data.withUnsafeBytes { bytes in
      _ = CC_SHA1(bytes.baseAddress, CC_LONG(data.count), &digest)
    }
    return digest.map { String(format: "%02hhx", $0) }.joined()
  }

  /// Returns the SHA256 hash of the string.
  ///
  /// Example:
  /// ```swift
  /// let str = "Hello"
  /// print(str.sha256()) // Output: "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"
  /// ```
  public func sha256() -> String {
    guard let data = data(using: .utf8) else { return "" }
    var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    data.withUnsafeBytes { bytes in
      _ = CC_SHA256(bytes.baseAddress, CC_LONG(data.count), &digest)
    }
    return digest.map { String(format: "%02hhx", $0) }.joined()
  }
}
