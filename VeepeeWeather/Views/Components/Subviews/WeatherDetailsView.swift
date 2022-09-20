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
        Text("WeatherDetailsView")
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
