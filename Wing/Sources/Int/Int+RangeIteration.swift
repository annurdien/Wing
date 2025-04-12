//
//  Int+RangeIteration.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

extension Int {
  /// Executes the given closure a specified number of times.
  ///
  /// ```swift
  /// 3.times { print("Hello") } // Prints "Hello" three times.
  /// ```
  ///
  /// - Parameter action: A closure that takes no arguments and returns no value.
  public func times(action: () -> Void) {
    guard self > 0 else { return }
    for _ in 0..<self {
      action()
    }
  }
  
  /// Executes the given closure for each integer from this value up to (and including) the given value.
  ///
  /// ```swift
  /// 1.upto(5) { print($0) } // Prints 1, 2, 3, 4, 5.
  /// ```
  ///
  /// - Parameters:
  ///   - value: The upper bound of the range (inclusive).
  ///   - action: A closure that takes the current integer as its argument and returns no value.
  public func upto(_ value: Int, action: (Int) -> Void) {
    guard self <= value else { return }
    for i in self...value {
      action(i)
    }
  }
  
  /// Executes the given closure for each integer from this value down to (and including) the given value.
  ///
  /// ```swift
  /// 5.downto(1) { print($0) } // Prints 5, 4, 3, 2, 1.
  /// ```
  ///
  /// - Parameters:
  ///   - value: The lower bound of the range (inclusive).
  ///   - action: A closure that takes the current integer as its argument and returns no value.
  public func downto(_ value: Int, action: (Int) -> Void) {
    guard self >= value else { return }
    for i in stride(from: self, through: value, by: -1) {
      action(i)
    }
  }
  
  /// Executes the given closure a specified number of times, providing the current iteration index.
  ///
  /// Example:
  /// ```swift
  /// 3.forEach { index in
  ///     print("Iteration: \(index)") // Prints "Iteration: 0", "Iteration: 1", "Iteration: 2"
  /// }
  /// ```
  ///
  /// - Parameter body: A closure that takes the current iteration index (starting from 0) as its argument and returns no value.
  public func forEach(body: (Int) -> Void) {
    guard self > 0 else { return }
    for i in 0..<self {
      body(i)
    }
  }
}
