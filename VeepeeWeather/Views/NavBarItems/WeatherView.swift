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
      VStack {
        Text(vm.cityLocal.name)
          .animation(.none)
          .animation(.easeInOut, value: vm.cityLocal.name)

      }

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
          PreviewDevice(rawValue: iPhone))

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
