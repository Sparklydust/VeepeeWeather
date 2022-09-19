//
//  WeatherCell.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 19/09/2022.
//

import SwiftUI

/// Cell with data of a one day forecast.
struct WeatherCell: View {

  var weather: WeatherLocal

  var body: some View {
    RoundedRectangle(cornerRadius: 16, style: .continuous)
      .stroke(Color.accentColor, lineWidth: 1.5)
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

// MARK: - Previews
struct WeatherCell_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      WeatherCell(weather: .fixtures())
        .previewDevice(
          PreviewDevice(rawValue: iPhone))

      WeatherCell(weather: .fixtures())
        .preferredColorScheme(.dark)
        .previewDevice(
          PreviewDevice(rawValue: iPhone))

      WeatherCell(weather: .fixtures())
        .previewDevice(
          PreviewDevice(rawValue: iPad))

      WeatherCell(weather: .fixtures())
        .preferredColorScheme(.dark)
        .previewDevice(
          PreviewDevice(rawValue: iPad))
    }
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
