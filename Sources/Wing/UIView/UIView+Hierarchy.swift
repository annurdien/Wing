//
//  UIView+Hierarchy.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

import UIKit

public extension UIView {
  
  /// Removes all subviews from the view.
  ///
  /// Example:
  /// ```swift
  /// view.removeAllSubviews()
  /// ```
  func removeAllSubviews() {
    subviews.forEach { $0.removeFromSuperview() }
  }
  
  /// Finds and returns the first responder within the view hierarchy.
  ///
  /// - Returns: The first responder, or `nil` if there is none.
  ///
  /// Example:
  /// ```swift
  /// if let firstResponder = view.findFirstResponder() {
  ///     print("First responder: \(firstResponder)")
  /// }
  /// ```
  func findFirstResponder() -> UIView? {
    if isFirstResponder {
      return self
    }
    for subview in subviews {
      if let firstResponder = subview.findFirstResponder() {
        return firstResponder
      }
    }
    return nil
  }
  
  /// Finds and returns the parent view controller of the view.
  ///
  /// - Returns: The parent `UIViewController` if it exists, otherwise `nil`.
  ///
  /// Example:
  /// ```swift
  /// if let viewController = view.getParentViewController() {
  ///     print("Parent view controller: \(viewController)")
  /// }
  /// ```
  func getParentViewController() -> UIViewController? {
    var parentResponder: UIResponder? = self
    while let responder = parentResponder {
      if let viewController = responder as? UIViewController {
        return viewController
      }
      parentResponder = responder.next
    }
    return nil
  }
}
