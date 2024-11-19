//
//  TabBar.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 19/11/24.
//

import SwiftUI

struct TabBar: View {
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor.third
        tabBarAppearance.shadowColor = nil
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("", systemImage: "house")
                }
            
            SearchView()
                .tabItem {
                    Label("", systemImage: "magnifyingglass")
                }
            
            ProfileView()
                .tabItem {
                    Label("", systemImage: "person.fill")
                }
        }
        .accentColor(.accentColor)
    }
}
