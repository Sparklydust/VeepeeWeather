//
//  SmallTemperatureView.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 19/09/2022.
//

import SwiftUI

/// Populates the Paris forecast on iOS and iPadOS.
struct SmallTemperatureView: View {

  var temperature: Double

  var body: some View {
    ZStack(alignment: .bottom) {
      ZStack {
        Circle()
          .trim(from: .zero, to: 0.66)
          .stroke(
            AngularGradient(
              gradient: Gradient(colors: [.blue, .red]),
              center: .center,
              startAngle: .degrees(.zero),
              endAngle: .degrees(250 - temperature)),
            style: StrokeStyle(lineWidth: 6, lineCap: .round))
          .rotationEffect(.degrees(152))
          .frame(
            minWidth: 16, idealWidth: 24, maxWidth: 32,
            minHeight: 16, idealHeight: 24, maxHeight: 32)

        Text(String(format: "%.0f", temperature))
          .font(.footnote)
          .fontWeight(.medium)
          .foregroundColor(.primary)
      }
      .padding(.bottom, -4)
      .padding(.trailing, -32)
    }
  }
}

// MARK: - Previews
struct SmallTemperatureView_Previews: PreviewProvider {

  static var previews: some View {
    SmallTemperatureView(temperature: 23.4)
  }
}
