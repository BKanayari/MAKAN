//
//  CustomTextFields.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 21/11/24.
//

import SwiftUI
struct CustomTextFields: View {
    @Binding var text: String
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    var boderColor: Color
    

    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(keyboardType)
            .font(.system(size: 14, weight: .medium))
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(boderColor, lineWidth: 1)
            )
            .padding(.trailing, 40).padding(.leading, 40)
    }
}
