//
//  TextField.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 21/11/24.
//

import SwiftUI

struct PasswordTextFields: View {
    @State var isSecure: Bool
    @Binding var textInput: String
    var placeholder: String
    var showEyeIcon: Bool
    var boderColor: Color
    
    var body: some View {
        HStack {
            if isSecure {
                SecureField(placeholder, text: $textInput)
                    .padding()
            } else {
                TextField(placeholder, text: $textInput)
                    .padding()
            }
            
            if showEyeIcon {
                Button(action: {
                    isSecure.toggle()
                }) {
                    //TODO: change to eye close
                    Image(isSecure ? ImageResource.icEye : ImageResource.icEye)
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 22, height: 15)
                }
                .padding(.trailing, 8)
            }
        }
        .font(.system(size: 14, weight: .medium))
        .frame(height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(boderColor, lineWidth: 1)
        )
        .padding(.trailing, 40).padding(.leading, 40)
    }
}


