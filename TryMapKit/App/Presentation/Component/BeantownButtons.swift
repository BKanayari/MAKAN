//
//  BeantownButtons.swift
//  TryMapKit
//
//  Created by bernardus kanayari on 18/11/24.
//

import Foundation
import SwiftUI
import MapKit

struct BeantownButtons: View {

  @Binding var position: MapCameraPosition
  @Binding var searchResults: [MKMapItem]
  var visibleRegion: MKCoordinateRegion?

  var body: some View {
    HStack {
      // Playground quick search button
      Button {
        search(for: "playground")
      } label: {
        Image(systemName: "figure.and.child.holdinghands")
      }
      .buttonStyle(.borderedProminent)

      // Beach quick search button
      Button {
        search(for: "beach")
      } label: {
        Image(systemName: "beach.umbrella")
      }
      .buttonStyle(.borderedProminent)

      // Button to show city
      Button {
        position = .region(.boston)
      } label: {
        Image(systemName: "building.2")
      }
      .buttonStyle(.bordered)

      // Button to show northShore of the city
      Button {
        position = .region(.northShore)
      } label: {
        Image(systemName: "water.waves")
      }
      .buttonStyle(.bordered)
    }
  }

  func search(for query: String) {
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = query
    request.resultTypes = .pointOfInterest
    request.region = visibleRegion ?? MKCoordinateRegion(
      center: .myLocation,
      span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    Task {
      let search = MKLocalSearch(request: request)
      let response = try? await search.start()
      DispatchQueue.main.async {
        searchResults = response?.mapItems ?? []
      }
    }
  }
}
