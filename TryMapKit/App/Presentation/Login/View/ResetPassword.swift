//
//  ResetPassword.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 23/11/24.
//
import SwiftUI

struct ResetPassword: View {
    @EnvironmentObject var router : Router
    @ObservedObject var viewModel = LoginViewModel()
    @State private var email = ""
    @State private var isFillEmail: Bool = false
    @State private var password = ""
    @State private var confirmPassword = ""
    var body: some View {
        ZStack {
            VStack {
                // Logo Section
                Image(ImageResource.logo)
                    .scenePadding()
                    .padding(.top, 24)
                
                if isFillEmail {
                    VStack(spacing: 18) {
                        // Sign-In Title
                        Text(DataConstants.resetPasswordText)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(Color.secondary)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .padding(.horizontal, 40)
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
                        PrimaryButton(title: DataConstants.confirmText, backgroundColor: Color.primary, titleColor: Color.white) {
                            //Reset Password
                        }
                    }
                } else {
                    VStack(spacing: 18) {
                        // Sign-In Title
                        Text(DataConstants.titleResetPassword)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(Color.secondary)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .padding(.horizontal, 40)
                        CustomTextFields(
                            text: $email,
                            placeholder: DataConstants.emailPlaceholder,
                            boderColor: Color.thirdColor
                        )
                        PrimaryButton(title: DataConstants.continueText, backgroundColor: Color.primary, titleColor: Color.white) {
                            isFillEmail = true
                        }
                    }
                }
                Spacer()
            }
            .frame(maxHeight: .infinity)
        }
    }
}

