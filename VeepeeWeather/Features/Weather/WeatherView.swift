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
  @Namespace var namespace

  var body: some View {
    NavigationView {
      if vm.showDetails {
        
        WeatherDetailsView(
          weather: vm.cityModel.selectedWeather!,
          showDetails: $vm.showDetails,
          namespace: namespace)
      } else {
        ScrollView {
          
          LazyVGrid(
            columns: [GridItem(), GridItem()],
            alignment: .center,
            spacing: 24
          ) {
            ForEach(vm.cityModel.weathers, id: \.id) { weather in
              Button(action: {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                  vm.showDetailsView(for: weather)
                }
              }) {
                WeatherCell(weather: weather, namespace: namespace)
              }
            }
          }
        }
        .navigationTitle(Text(vm.cityModel.name))
        .navigationBarTitleDisplayMode(.large)
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
        .previewDevice(
          PreviewDevice(rawValue: iPad))
    }
  }
}
