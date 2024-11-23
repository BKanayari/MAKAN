//
//  Register.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 23/11/24.
//

import SwiftUI

struct Register: View {
    @EnvironmentObject var router : Router
    @ObservedObject var viewModel = LoginViewModel()
    @State private var name = ""
    @State private var email = ""
    var body: some View {
        ZStack {
            VStack {
                // Logo Section
                Image(ImageResource.logo)
                    .scenePadding()
                // Sign-In Title
                Text(DataConstants.createAccountText)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(Color.secondary)
            
                VStack(spacing: 18) {
                    CustomTextFields(
                        text: $name,
                        placeholder: DataConstants.namePlaceholder,
                        boderColor: Color.thirdColor
                    )
                    CustomTextFields(
                        text: $email,
                        placeholder: DataConstants.emailPlaceholder,
                        boderColor: Color.thirdColor
                    )
                    PasswordTextFields(
                        isSecure: false,
                        textInput: $viewModel.password,
                        placeholder: DataConstants.password,
                        showEyeIcon: true,
                        boderColor: viewModel.confirmPasswordBorderColor
                    )
                    PasswordTextFields(
                        isSecure: false,
                        textInput: $viewModel.confirmPassword,
                        placeholder: DataConstants.confirmPasswordPlaceholder,
                        showEyeIcon: true,
                        boderColor: viewModel.confirmPasswordBorderColor
                    )
                }
                .padding(.bottom, 14)
                VStack(spacing: 20) {
                    Image(ImageResource.deviderOr)
                    Button(action: {
                        // Sign-In with Google
                    }) {
                        HStack {
                            Image(ImageResource.icGoogle)
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(DataConstants.signInWithGoogle)
                                .foregroundColor(Color.secondary)
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.thirdColor)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal, 40)
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
}
