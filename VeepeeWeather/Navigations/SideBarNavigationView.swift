//
//  SideBarNavigationView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

/// Sidebar items for iPadOS navigation.
///
/// View that contains the SceneStorage for iPad navigations
/// when multiple windows is used.
struct SideBarNavigationView: View {

  /// Key saving Scene chosen by the user when using the
  /// application on iPad or macOS.
  @SceneStorage("selected_scene")
  var sideBarSelection: String?

  var body: some View {
    NavigationView {
      sidebar

      WeatherView()
    }
  }

  // MARK: - Sidebar
  var sidebar: some View {
    List(selection: $sideBarSelection) {
      NavigationLink(destination: WeatherView()) {
        Label("Weather", systemImage: "thermometer.sun.fill")
      }
      .tag("weather")
    }
  }
}

// MARK: - Previews
struct SideBarNavigationView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      SideBarNavigationView()

      SideBarNavigationView()
        .preferredColorScheme(.dark)
    }
    .previewDevice(
      PreviewDevice(rawValue: iPad))
  }
}
