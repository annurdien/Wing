//
//  Int+Math.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Foundation
import CoreGraphics

extension BinaryInteger {
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
  public func power(of exponent: Self) -> Self {
    guard exponent >= 0 else { return 0 }
    if exponent == 0 { return 1 }
    var result: Self = 1
    for _ in 0..<Int(exponent) {
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
    
    let limit = Self(Double(self).squareRoot()) + 1
    var i: Self = 2
    while i < limit {
      if self % i == 0 {
        return false
      }
      i += 1
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
  public var factorial: Self {
    guard self >= 0 else { return 1 } // Could throw instead
    if self == 0 { return 1 }
    var result: Self = 1
    var i: Self = 1
    while i <= self {
      result *= i
      i += 1
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
  public func isDivisible(by divisor: Self) -> Bool {
    guard divisor != 0 else { return false }
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
  public func gcd(with other: Self) -> Self {
    var a = self.magnitude
    var b = other.magnitude
    while b != 0 {
      let temp = b
      b = a % b
      a = temp
    }
    return Self(a)
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
  public func lcm(with other: Self) -> Self {
    guard self != 0 && other != 0 else { return 0 }
    return Self((self * other).magnitude) / self.gcd(with: other)
  }
}
