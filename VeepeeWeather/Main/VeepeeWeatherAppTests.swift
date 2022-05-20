//
//  VeepeeWeatherAppTests.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

/// Unit Testing entry point to run the VeepeeWeather application.
///
/// This struct is used when triggering the system under tests and
/// not in production, which would bypass the ``VeepeeWeatherApp``
/// application entry point.
struct VeepeeWeatherAppTests: App {

  var body: some Scene {
    WindowGroup { EmptyView() }
  }
}
