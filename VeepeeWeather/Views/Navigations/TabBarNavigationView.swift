//
//  TabBarNavigationView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

/// iOS classic tab bar definition with
/// all main tab views.
struct TabBarNavigationView: View {

  @State private var selectedTabBar: NavigationItem = .weather
  
  var body: some View {
    TabView(selection: $selectedTabBar) {
      WeatherView()
        .tabItem { Label("Weather", systemImage: "thermometer.sun.fill") }
        .tag("weather")
    }
  }
}

// MARK: - Previews
struct TabBarNavigationView_Previews: PreviewProvider {

  static var previews: some View {
    TabBarNavigationView()
      .previewDevice(
        PreviewDevice(rawValue: iPhone))
  }
}
