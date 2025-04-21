//
//  UIView+Gesture.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

import UIKit

@MainActor private var ActionKey: UInt8 = 0

public extension UIView {
  
  // MARK: - Tap Gesture with Closure
  
  /// Adds a tap gesture recognizer to the view and handles the action using a closure.
  ///
  /// - Parameter action: The closure to execute when the gesture is recognized.
  ///
  /// Example:
  /// ```swift
  /// view.addTapGesture { print("View tapped!") }
  /// ```
  func addTapGesture(action: @escaping () -> Void) {
    let tap = UITapGestureRecognizer()
    tap.addAction(action)
    isUserInteractionEnabled = true
    addGestureRecognizer(tap)
  }
  
  // MARK: - Long Press Gesture with Closure
  
  /// Adds a long press gesture recognizer to the view and handles the action using a closure.
  ///
  /// - Parameters:
  ///   - minimumPressDuration: The minimum time (in seconds) the user must press (default is 0.5).
  ///   - action: The closure to execute when the gesture is recognized.
  ///
  /// Example:
  /// ```swift
  /// view.addLongPressGesture { print("View long-pressed!") }
  /// ```
  func addLongPressGesture(minimumPressDuration: TimeInterval = 0.5, action: @escaping () -> Void) {
    let longPress = UILongPressGestureRecognizer()
    longPress.minimumPressDuration = minimumPressDuration
    longPress.addAction(action)
    isUserInteractionEnabled = true
    addGestureRecognizer(longPress)
  }
  
  // MARK: - Swipe Gesture with Closure
  
  /// Adds a swipe gesture recognizer to the view and handles the action using a closure.
  ///
  /// - Parameters:
  ///   - direction: The direction of the swipe (e.g., `.left`, `.right`).
  ///   - action: The closure to execute when the gesture is recognized.
  ///
  /// Example:
  /// ```swift
  /// view.addSwipeGesture(direction: .left) { print("View swiped left!") }
  /// ```
  func addSwipeGesture(direction: UISwipeGestureRecognizer.Direction, action: @escaping () -> Void) {
    let swipe = UISwipeGestureRecognizer()
    swipe.direction = direction
    swipe.addAction(action)
    isUserInteractionEnabled = true
    addGestureRecognizer(swipe)
  }
}

// MARK: - UIGestureRecognizer Extension for Closures

private extension UIGestureRecognizer {
  
  /// Associates a closure with the gesture recognizer to handle actions.
  ///
  /// - Parameter action: The closure to execute when the gesture is recognized.
  func addAction(_ action: @escaping () -> Void) {
    // Store the action in the associated object
    objc_setAssociatedObject(self, &ActionKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    addTarget(self, action: #selector(handleAction))
  }
  
  /// Executes the associated closure when the gesture is recognized.
  @objc func handleAction() {
    if let action = objc_getAssociatedObject(self, &ActionKey) as? () -> Void {
      action()
    }
  }
}
