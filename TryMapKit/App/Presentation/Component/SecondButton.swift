//
//  SecondButton.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 21/11/24.
//

import SwiftUI

struct SecondButton: View {
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color = .white
    var cornerRadius: CGFloat = 10
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(foregroundColor)
                .padding()
                .controlSize(.large)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        }
    }
}

