//
//  UIView+Animation.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

#if canImport(UIKit)

import UIKit

public extension UIView {
  
  /// Shakes the view horizontally.
  ///
  /// - Parameter duration: The duration of the animation.
  ///
  /// Example:
  /// ```swift
  /// view.shake()
  /// ```
  func shake(duration: CFTimeInterval = 0.5) {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.timingFunction = CAMediaTimingFunction(name: .linear)
    animation.duration = duration
    animation.values = [-10, 10, -8, 8, -5, 5, 0]
    layer.add(animation, forKey: "shake")
  }
  
  /// Fades the view in or out.
  ///
  /// - Parameters:
  ///   - isIn: Pass `true` to fade in, `false` to fade out.
  ///   - duration: The duration of the animation.
  ///
  /// Example:
  /// ```swift
  /// view.fade(isIn: true, duration: 0.3)
  /// ```
  func fade(isIn: Bool, duration: TimeInterval = 0.3) {
    UIView.animate(withDuration: duration) {
      self.alpha = isIn ? 1.0 : 0.0
    }
  }
}

#endif
