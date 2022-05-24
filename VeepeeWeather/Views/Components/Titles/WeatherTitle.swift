//
//  WeatherTitle.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 23/05/2022.
//

import SwiftUI

/// Populates the title of the ``WeatherView``
/// as the city name of the shown forecast.
struct WeatherTitle: View {

  @ObservedObject var vm: WeatherViewModel

  var body: some View {

    Text(vm.cityLocal.name)
      .font(.largeTitle)
      .fontWeight(.bold)
      .foregroundColor(.accentColor)
      .animation(.none)
      .animation(.easeInOut, value: vm.cityLocal.name)
  }
}

struct WeatherTitle_Previews: PreviewProvider {

  @StateObject static var vm = WeatherViewModel()

  static var previews: some View {
    Group {
      WeatherTitle(vm: vm)
        .padding()
        .previewLayout(.sizeThatFits)
        .previewDevice(
          PreviewDevice(rawValue: iPhone))

      WeatherTitle(vm: vm)
        .padding()
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        .previewDevice(
          PreviewDevice(rawValue: iPhone))

      Group {
        WeatherTitle(vm: vm)
          .padding()
          .previewLayout(.sizeThatFits)
          .previewDevice(
            PreviewDevice(rawValue: iPad))

        WeatherTitle(vm: vm)
          .padding()
          .previewLayout(.sizeThatFits)
          .preferredColorScheme(.dark)
          .previewDevice(
            PreviewDevice(rawValue: iPad))
      }
    }
  }
}
