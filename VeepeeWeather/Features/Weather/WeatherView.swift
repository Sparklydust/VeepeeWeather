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
    NavigationView {
      ScrollView {

        LazyVGrid(
          columns: [GridItem(), GridItem()],
          alignment: .center,
          spacing: 24
        ) {
          ForEach(vm.cityLocal.weathers, id: \.id) { weather in

            NavigationLink {
              WeatherDetailsView()
            } label: {
              WeatherCell(weather: weather)
            }
          }
        }
      }
      .navigationTitle(Text(vm.cityLocal.name))
      .navigationBarTitleDisplayMode(.large)
      .padding(.top, 40)

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
        .previewDevice(
          PreviewDevice(rawValue: iPad))
    }
  }
}
