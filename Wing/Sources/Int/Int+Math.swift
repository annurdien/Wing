//
//  Int+Math.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation
import CoreGraphics

extension Int {
  /// Returns the result of raising the current integer to the power of the given integer.
  ///
  /// Example:
  /// ```swift
  /// let base = 2
  /// let exponent = 3
  /// let result = base.power(of: exponent) // 8
  /// ```
  ///
  /// - Parameter exponent: The power to raise the integer to.
  /// - Returns: The integer raised to the given power.
  public func power(of exponent: Int) -> Int {
    guard exponent >= 0 else { return 0 } // Or throw an error for negative exponents
    if exponent == 0 { return 1 }
    var result = self
    for _ in 1..<exponent {
      result *= self
    }
    return result
  }
  
  /// Returns `true` if the integer is a prime number, `false` otherwise.
  ///
  /// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
  ///
  /// Example:
  /// ```swift
  /// let number1 = 7
  /// let isSevenPrime = number1.isPrime // true
  ///
  /// let number2 = 10
  /// let isTenPrime = number2.isPrime // false
  /// ```
  public var isPrime: Bool {
    guard self > 1 else { return false }
    for i in 2..<Int(sqrt(Double(self))) + 1 {
      if self % i == 0 {
        return false
      }
    }
    return true
  }
  
  /// Returns the factorial of the integer.
  ///
  /// The factorial of a non-negative integer n, denoted by n!, is the product of all positive integers less than or equal to n.
  ///
  /// Example:
  /// ```swift
  /// let number = 5
  /// let factorialOfFive = number.factorial // 120 (5 * 4 * 3 * 2 * 1)
  /// ```
  public var factorial: Int {
    guard self >= 0 else { return 1 } // Or throw an error for negative input
    if self == 0 { return 1 }
    var result = 1
    for i in 1...self {
      result *= i
    }
    return result
  }
  
  /// Returns `true` if the integer is divisible by the given integer, `false` otherwise.
  ///
  /// Example:
  /// ```swift
  /// let number = 10
  /// let isDivisibleByTwo = number.isDivisible(by: 2) // true
  /// let isDivisibleByThree = number.isDivisible(by: 3) // false
  /// ```
  ///
  /// - Parameter divisor: The integer to check for divisibility.
  /// - Returns: `true` if the integer is divisible by `divisor`, `false` otherwise.
  public func isDivisible(by divisor: Int) -> Bool {
    guard divisor != 0 else { return false } // Avoid division by zero
    return self % divisor == 0
  }
  
  /// Returns the greatest common divisor (GCD) of the current integer and the given integer.
  ///
  /// Example:
  /// ```swift
  /// let a = 48
  /// let b = 18
  /// let gcdValue = a.gcd(with: b) // 6
  /// ```
  ///
  /// - Parameter other: The other integer to calculate the GCD with.
  /// - Returns: The greatest common divisor.
  public func gcd(with other: Int) -> Int {
    var a = abs(self)
    var b = abs(other)
    while b != 0 {
      (a, b) = (b, a % b)
    }
    return a
  }
  
  /// Returns the least common multiple (LCM) of the current integer and the given integer.
  ///
  /// Example:
  /// ```swift
  /// let a = 12
  /// let b = 18
  /// let lcmValue = a.lcm(with: b) // 36
  /// ```
  ///
  /// - Parameter other: The other integer to calculate the LCM with.
  /// - Returns: The least common multiple.
  public func lcm(with other: Int) -> Int {
    guard self != 0 && other != 0 else { return 0 }
    return abs(self * other) / gcd(with: other)
  }
}
