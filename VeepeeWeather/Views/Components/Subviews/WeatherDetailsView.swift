//
//  WeatherDetailsView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 20/09/2022.
//

import SwiftUI

/// Populate a full view with the details of a
/// forecast for a same day. 
struct WeatherDetailsView: View {

  var weather: WeatherLocal

  @Binding var showDetails: Bool
  var namespace: Namespace.ID

  var body: some View {
    ZStack(alignment: .topTrailing) {

      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .stroke(Color.accentColor, lineWidth: 3)
        .overlay { content }
        .padding()

      Button(action: {
        withAnimation(.easeInOut) { showDetails = false }
      }) {
        Image(systemName: "x.circle.fill")
          .font(.largeTitle)
          .foregroundColor(.secondary)
          .offset(x: -24, y: 24)
      }
    }
    .matchedGeometryEffect(id: weather.id, in: namespace)
  }

  var content: some View {
    VStack {
      Text(weather.date.formatted(date: .complete, time: .omitted))
        .font(.title3)
        .padding(15)

      HStack(alignment: .top) {
        AsyncImageView(imageURL: weather.icon)
          .frame(minHeight: 80, idealHeight: 100, maxHeight: 120)
          .padding(16)

        Text(weather.info)
          .font(.body)
          .multilineTextAlignment(.leading)
          .lineLimit(.zero)

        Spacer()
      }
      Spacer()

      MediumTemperatureView(weather: weather)

      Spacer()
      Spacer()
    }
  }
}

// MARK: - Previews
struct WeatherDetailsView_Previews: PreviewProvider {

  @Namespace static var namespace

  static var previews: some View {
    WeatherDetailsView(
      weather: .fixture(),
      showDetails: .constant(false),
      namespace: namespace)
    .previewDevice(PreviewDevice(rawValue: iPhone))
  }
}
