//
//  RouterNavigation.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 20/11/24.
//

import Foundation
import SwiftUI

enum Destination {
    case HomeScreen
    case RestourantDetailScreen
}

class Router: ObservableObject {
    @Published var path : [Destination] = []
    
    func popToRoot(){
        path.removeLast(path.count)
    }
    
    func popToPage(page: Destination){
        if let index = path.firstIndex(of: page){
            path.removeLast(path.count - (index + 1))
        } else {
            print("Value not found in the array")
        }
    }
}

class ViewFactory {
    @ViewBuilder
    static func viewForDestination(_ destination: Destination) -> some View {
        switch destination {
        case.HomeScreen:
            HomeView()
        case.RestourantDetailScreen:
            RestaurantDetail()
        }
    }
}
