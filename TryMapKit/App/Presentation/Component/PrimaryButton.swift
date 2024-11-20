//
//  PrimaryButton.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 20/11/24.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var backgroundColor: Color = Color.primary
    var foregroundColor: Color = .white
    var cornerRadius: CGFloat = 10
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(foregroundColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        }
        .padding(.horizontal)
    }
}
