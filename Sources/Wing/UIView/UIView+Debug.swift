//
//  UIView+Debug.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

import UIKit

public extension UIView {
  
  /// Highlights the view by adding a temporary border for debugging purposes.
  ///
  /// - Parameters:
  ///   - color: The color of the border (default is red).
  ///   - width: The width of the border (default is 1).
  ///   - duration: The duration (in seconds) for which the border should appear (default is 2 seconds).
  ///
  /// Example:
  /// ```swift
  /// view.debugHighlight()
  /// ```
  func debugHighlight(color: UIColor = .red, width: CGFloat = 1, duration: TimeInterval = 2) {
    let originalBorderColor = layer.borderColor
    let originalBorderWidth = layer.borderWidth
    
    layer.borderColor = color.cgColor
    layer.borderWidth = width
    
    DispatchQueue.main.asyncAfter(deadline: .now() + duration) { [weak self] in
      self?.layer.borderColor = originalBorderColor
      self?.layer.borderWidth = originalBorderWidth
    }
  }
  
  /// Prints the view hierarchy for debugging purposes.
  ///
  /// - Parameter indentation: The indentation level (default is 0).
  ///
  /// Example:
  /// ```swift
  /// view.printViewHierarchy()
  /// ```
  func printViewHierarchy(indentation: Int = 0) {
    let indent = String(repeating: " ", count: indentation * 2)
    print("\(indent)\(self)")
    subviews.forEach { $0.printViewHierarchy(indentation: indentation + 1) }
  }
}
