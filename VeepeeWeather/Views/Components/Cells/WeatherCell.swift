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
  var namespace: Namespace.ID

  var body: some View {
    RoundedRectangle(cornerRadius: 16, style: .continuous)
      .stroke(Color.accentColor, lineWidth: 1.5)
      .overlay { content }
      .matchedGeometryEffect(id: weather.id, in: namespace)
      .frame(
        minWidth: 50, idealWidth: 150, maxWidth: 250,
        minHeight: 30, idealHeight: 100, maxHeight: 150
      )
      .padding()
  }

  // MARK: Content
  var content: some View {
    ZStack {
      ZStack(alignment: .leading) {
        Color.clear

        VStack {
          AsyncImageView(imageURL: weather.icon)
            .frame(minHeight: 16, idealHeight: 32, maxHeight: 48)

          Spacer()

          Text(weather.type.rawValue)
            .font(.headline)
            .foregroundColor(.primary)
        }
        .padding(8)
      }

      ZStack(alignment: .trailing) {
        Color.clear

        VStack {
          Text(weather.date.formatted(date: .numeric, time: .omitted))
            .font(.subheadline)
            .foregroundColor(.primary)

          Spacer()

          SmallTemperatureView(temperature: weather.temp)
        }
        .padding(8)
      }
    }
  }
}

// MARK: - Previews
struct WeatherCell_Previews: PreviewProvider {

  @Namespace static var namespace

  static var previews: some View {
    WeatherCell(weather: .fixture(), namespace: namespace)
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
