//
//  Date+Format.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 22/05/2022.
//

import Foundation

extension DateFormatter {

  /// Create a ``Date`` from a date in a string format.
  /// - Parameter stringDate: The iso date set as a string.
  /// - Returns: A Date formatted from a string. 
  static func createDate(with stringDate: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY-MM-DD HH:mm:ss"
    return formatter.date(from: stringDate) ?? Date()
  }
}
