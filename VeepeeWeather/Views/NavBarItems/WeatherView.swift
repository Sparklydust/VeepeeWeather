//
//  WeatherView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/05/2022.
//

import SwiftUI

/// Populates the Paris forecast on iOS and iPadOS.
struct WeatherView: View {

  @StateObject var vm = WeatherViewModel()

  var body: some View {
    Text("WeatherView")
      .task { await vm.getParisForecast() }
  }
}

// MARK: - Previews
struct WeatherView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      WeatherView()

      WeatherView()
        .preferredColorScheme(.dark)
    }
    .previewDevice(
      PreviewDevice(rawValue: iPad))
  }
}
