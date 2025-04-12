//
//  Int+Random.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

import Foundation

extension Int {
  /// Returns a random integer within the specified inclusive range.
  ///
  /// ```swift
  /// let randomNumber = Int.random(in: 1...10)
  /// ```
  ///
  /// - Parameter range: The inclusive range within which to generate a random integer.
  /// - Returns: A random integer within the specified range.
  public static func random(in range: ClosedRange<Int>) -> Int {
    let min = range.lowerBound
    let max = range.upperBound
    let diff = max - min + 1
    return min + Int(arc4random_uniform(UInt32(diff)))
  }
}
