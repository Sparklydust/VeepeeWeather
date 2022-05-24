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
      VStack(spacing: 40) {
        WeatherTitle(vm: vm)

        LazyVGrid(
          columns: [
            GridItem(),
            GridItem()
          ],
          alignment: .center,
          spacing: 24
        ) {
          ForEach(vm.cityLocal.weathers, id: \.id) { weather in
            RoundedRectangle(cornerRadius: 16, style: .continuous)
              .stroke(Color.accentColor, lineWidth: 2)
              .frame(
                minWidth: 50, idealWidth: 150, maxWidth: 250,
                minHeight: 30, idealHeight: 100, maxHeight: 150
              )
              .overlay {
                Text(weather.type.rawValue)
                  .foregroundColor(.black)
                  .padding(4)
              }
              .padding()
          }
        }
        .padding()
        Spacer()
      }
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
