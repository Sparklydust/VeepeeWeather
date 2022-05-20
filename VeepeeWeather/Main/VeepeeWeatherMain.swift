//
//  VeepeeWeatherMain.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import Foundation

/// Main entry point at the VeepeeWeather application startup.
///
/// VeepeeWeatherMain check if the application is triggering
/// tests which would bypass the VeepeeWeatherApp and run the
/// OnGearAppTests instead.
@main
struct VeepeeWeatherMain {

  static func main() throws {
    guard NSClassFromString("XCTestCase") == nil else {
      VeepeeWeatherAppTests.main()
      return
    }
    VeepeeWeatherApp.main()
  }
}
