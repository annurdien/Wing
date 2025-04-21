//
//  Date+Extensions.swift
//  Wing
//
//  Created by Annurdien Rasyid on 21/04/25.
//

import Foundation

public extension Date {
  
  // MARK: - Formatting
  
  /// Formats the date into a string using the specified format.
  ///
  /// - Parameter format: The date format string (e.g., "yyyy-MM-dd HH:mm:ss").
  /// - Returns: A formatted string representation of the date.
  ///
  /// Example:
  /// ```swift
  /// let now = Date()
  /// let formatted = now.toString("yyyy-MM-dd")
  /// print(formatted) // Prints: 2025-04-21
  /// ```
  func toString(_ format: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: self)
  }
  
  /// Converts the date to a string with a specified style.
  ///
  /// - Parameters:
  ///   - dateStyle: The style for the date portion (e.g., `.short`, `.medium`, `.long`).
  ///   - timeStyle: The style for the time portion (e.g., `.short`, `.medium`, `.long`).
  /// - Returns: A string representation of the date.
  ///
  /// Example:
  /// ```swift
  /// let now = Date()
  /// let formatted = now.toString(dateStyle: .medium, timeStyle: .short)
  /// print(formatted) // Prints: Apr 21, 2025 at 7:09 AM
  /// ```
  func toString(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = dateStyle
    formatter.timeStyle = timeStyle
    return formatter.string(from: self)
  }
  
  // MARK: - Calculations
  
  /// Adds a specified number of days to the date.
  ///
  /// - Parameter days: The number of days to add.
  /// - Returns: A new date with the days added.
  ///
  /// Example:
  /// ```swift
  /// let today = Date()
  /// let tomorrow = today.addingDays(1)
  /// print(tomorrow)
  /// ```
  func addingDays(_ days: Int) -> Date {
    return Calendar.current.date(byAdding: .day, value: days, to: self) ?? self
  }
  
  /// Adds a specified number of hours to the date.
  ///
  /// - Parameter hours: The number of hours to add.
  /// - Returns: A new date with the hours added.
  ///
  /// Example:
  /// ```swift
  /// let now = Date()
  /// let later = now.addingHours(3)
  /// print(later)
  /// ```
  func addingHours(_ hours: Int) -> Date {
    return Calendar.current.date(byAdding: .hour, value: hours, to: self) ?? self
  }
  
  /// Calculates the difference in days between this date and another date.
  ///
  /// - Parameter date: The other date to compare.
  /// - Returns: The number of days between the two dates.
  ///
  /// Example:
  /// ```swift
  /// let now = Date()
  /// let earlier = now.addingDays(-5)
  /// let diff = now.days(from: earlier)
  /// print(diff) // Prints: 5
  /// ```
  func days(from date: Date) -> Int {
    let components = Calendar.current.dateComponents([.day], from: date, to: self)
    return components.day ?? 0
  }
  
  // MARK: - Comparisons
  
  /// Checks if the date is today.
  ///
  /// - Returns: `true` if the date is today, otherwise `false`.
  ///
  /// Example:
  /// ```swift
  /// let today = Date()
  /// print(today.isToday()) // Prints: true
  /// ```
  func isToday() -> Bool {
    return Calendar.current.isDateInToday(self)
  }
  
  /// Checks if the date is in the past.
  ///
  /// - Returns: `true` if the date is in the past, otherwise `false`.
  ///
  /// Example:
  /// ```swift
  /// let pastDate = Date().addingDays(-1)
  /// print(pastDate.isInPast()) // Prints: true
  /// ```
  func isInPast() -> Bool {
    return self < Date()
  }
  
  /// Checks if the date is in the future.
  ///
  /// - Returns: `true` if the date is in the future, otherwise `false`.
  ///
  /// Example:
  /// ```swift
  /// let futureDate = Date().addingDays(1)
  /// print(futureDate.isInFuture()) // Prints: true
  /// ```
  func isInFuture() -> Bool {
    return self > Date()
  }
  
  // MARK: - Relative Time
  
  /// Returns a relative time string for the date (e.g., "2 hours ago", "3 days from now").
  ///
  /// - Returns: A string representing the relative time.
  ///
  /// Example:
  /// ```swift
  /// let futureDate = Date().addingDays(3)
  /// print(futureDate.relativeTime()) // Prints: "3 days from now"
  /// ```
  func relativeTime() -> String {
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .full
    return formatter.string(for: self) ?? ""
  }
}
