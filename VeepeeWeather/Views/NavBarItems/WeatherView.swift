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
    ZStack {
      Text("WeatherView")

      MainProgressView(isAnimating: vm.isLoading)
    }
    .task { await vm.getParisForecast() }
  }
}

// MARK: - Previews
struct WeatherView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      WeatherView()
        .previewDevice(
          PreviewDevice(rawValue: iPhone))

      WeatherView()
        .preferredColorScheme(.dark)
        .previewDevice(
          PreviewDevice(rawValue: iPad))

      WeatherView()
        .previewDevice(
          PreviewDevice(rawValue: iPad))

      WeatherView()
        .preferredColorScheme(.dark)
        .previewDevice(
          PreviewDevice(rawValue: iPad))
    }
  }
}
