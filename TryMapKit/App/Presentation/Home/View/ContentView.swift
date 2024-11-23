//
//  ContentView.swift
//  TryMapKit
//
//  Created by bernardus kanayari on 18/11/24.
//

import SwiftUI
import MapKit

struct ContentView: View {

  @State private var position: MapCameraPosition = .automatic
  @State private var visibleRegion: MKCoordinateRegion?

  @State private var searchResult: [MKMapItem] = []
  @State private var seletedResult: MKMapItem?
  @State private var selectedTag: Int?

  var body: some View {
    Map(position: $position, selection: $seletedResult){
//      /*Marker(item: mapItem*/)

      Annotation("Me", coordinate: .myLocation) {
        ZStack{
          RoundedRectangle(cornerRadius: 10)
            .fill(.background)
          RoundedRectangle(cornerRadius: 10)
            .stroke(.secondary, lineWidth: 5)
          Image(systemName: "figure.wave")
            .padding(5)
        }
      }
      .annotationTitles(.hidden)

      ForEach(searchResult, id: \.self) { result in
        Marker(item: result)
      }
    }
    .safeAreaInset(edge: .bottom) {
      HStack{
        Spacer()
        BeantownButtons(position: $position, searchResults: $searchResult, visibleRegion: visibleRegion)
          .padding(.top)
        Spacer()
      }
      .background(.thinMaterial)
    }
    .onChange(of: searchResult) {
      position = .automatic
    }
    .onMapCameraChange{ context in
      visibleRegion = context.region
    }
  }
}


#Preview {
  ContentView()
}

extension CLLocationCoordinate2D {
  static let myLocation = CLLocationCoordinate2D(latitude: 42.361145, longitude: -71.057083)
}

extension MKCoordinateRegion{
  static let boston = MKCoordinateRegion(
    center: CLLocationCoordinate2D(
      latitude: 42.361145,
      longitude: -71.057083),
    span: .init(
      latitudeDelta: 0.1,
      longitudeDelta: 0.1)
  )

  static let northShore = MKCoordinateRegion(
    center: CLLocationCoordinate2D(
      latitude: 42.547408,
      longitude: -70.870085),
    span: .init(
      latitudeDelta: 0.5,
      longitudeDelta: 0.5)
  )
}
