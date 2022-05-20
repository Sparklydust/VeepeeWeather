//
//  VeepeeWeatherApp.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

/// Production code entry point running the VeepeeWeather application.
///
/// This struct is used when the system is in production and
/// not under tests.
struct VeepeeWeatherApp: App {

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
