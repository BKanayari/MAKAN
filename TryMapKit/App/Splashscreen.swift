//
//  Splashscreen.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 21/11/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            Login()
        } else {
            ZStack {
                Color.primary
                    .ignoresSafeArea()
                Image(ImageResource.logo)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    isActive = true
                }
            }
        }
    }
}

