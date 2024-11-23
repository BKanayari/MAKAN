//
//  PrimaryButton.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 20/11/24.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var backgroundColor: Color
    var titleColor: Color
    var cornerRadius: CGFloat = 10
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(titleColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        }
        .padding(.trailing, 40).padding(.leading, 40)
    }
}
