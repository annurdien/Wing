//
//  UIView+Styling.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

import UIKit

public extension UIView {
  
  /// Rounds the specified corners of the view.
  ///
  /// - Parameters:
  ///   - corners: The corners to round (e.g., `.topLeft`, `.bottomRight`).
  ///   - radius: The radius of the corner rounding.
  ///
  /// Example:
  /// ```swift
  /// view.roundCorners([.topLeft, .topRight], radius: 10)
  /// ```
  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(
      roundedRect: bounds,
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius, height: radius)
    )
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    layer.mask = mask
  }
  
  /// Adds a border to the view.
  ///
  /// - Parameters:
  ///   - color: The color of the border.
  ///   - width: The width of the border.
  ///
  /// Example:
  /// ```swift
  /// view.addBorder(color: .red, width: 2)
  /// ```
  func addBorder(color: UIColor, width: CGFloat) {
    layer.borderColor = color.cgColor
    layer.borderWidth = width
  }
  
  /// Adds a shadow to the view.
  ///
  /// - Parameters:
  ///   - color: The color of the shadow.
  ///   - opacity: The opacity of the shadow (0.0 - 1.0).
  ///   - offset: The offset of the shadow.
  ///   - radius: The blur radius of the shadow.
  ///
  /// Example:
  /// ```swift
  /// view.addShadow(color: .black, opacity: 0.3, offset: CGSize(width: 0, height: 2), radius: 4)
  /// ```
  func addShadow(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat) {
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offset
    layer.shadowRadius = radius
    layer.masksToBounds = false
  }
  
  /// Adds a gradient background to the view.
  ///
  /// - Parameters:
  ///   - colors: An array of `UIColor` to use in the gradient.
  ///   - startPoint: The starting point of the gradient (default is top-left).
  ///   - endPoint: The ending point of the gradient (default is bottom-right).
  ///
  /// Example:
  /// ```swift
  /// view.addGradientBackground(colors: [.red, .blue])
  /// ```
  func addGradientBackground(colors: [UIColor], startPoint: CGPoint = CGPoint(x: 0, y: 0), endPoint: CGPoint = CGPoint(x: 1, y: 1)) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = colors.map { $0.cgColor }
    gradientLayer.startPoint = startPoint
    gradientLayer.endPoint = endPoint
    gradientLayer.frame = bounds
    layer.insertSublayer(gradientLayer, at: 0)
  }
}
