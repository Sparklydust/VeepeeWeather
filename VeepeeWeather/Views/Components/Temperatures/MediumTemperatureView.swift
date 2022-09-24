//
//  MediumTemperatureView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 21/09/2022.
//

import SwiftUI

struct MediumTemperatureView: View {

  var weather: WeatherModel

  var body: some View {
    HStack {
      Text(String(format: "%.0f", weather.tempMin))

      Capsule(style: .continuous)
        .fill(LinearGradient(
          gradient: Gradient(colors: [.blue, .red]),
          startPoint: .leading,
          endPoint: .trailing
        ))
        .frame(height: 8)
        .overlay(alignment: .top) {
          Text(String(format: "%.1f", weather.temp))
            .offset(y: -32)
        }

      Text(String(format: "%.0f", weather.tempMax))
    }
    .padding(16)
  }
}

// MARK: - Previews
struct MediumTemperatureView_Previews: PreviewProvider {

  static var previews: some View {
    MediumTemperatureView(weather: .fixture())
      .previewDevice(PreviewDevice(rawValue: iPhone))
  }
}
