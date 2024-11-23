//
//  Login.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 21/11/24.
//


import SwiftUI

struct Login: View {
    @StateObject var router = Router()
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack {
                VStack {
                    // Logo Section
                    Image(ImageResource.logo)
                        .scenePadding()
                    // Sign-In Title
                    Text(DataConstants.signIn)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(Color.secondary)
                
                    VStack(spacing: 18) {
                        CustomTextFields(
                            text: $username,
                            placeholder: DataConstants.usernameEmail,
                            boderColor: Color.thirdColor
                        )
                        PasswordTextFields(
                            isSecure: false,
                            textInput: $password,
                            placeholder: DataConstants.password,
                            showEyeIcon: true,
                            boderColor: Color.thirdColor
                        )
                        .padding(.bottom, 16)
                        Button(DataConstants.forgotPassword) {
                            router.path.append(.resetPassword)
                        }
                        .font(.system(size: 12, weight: .bold))
                        .padding(.bottom, 16)
                    }
                
                    VStack(spacing: 16) {
                        PrimaryButton(title: DataConstants.signIn, backgroundColor: Color.primary, titleColor: Color.white) {
                            router.path.append(.TabbarScreen)
                        }
                        PrimaryButton(title: DataConstants.createAccount, backgroundColor: Color.thirdColor, titleColor: Color.secondary) {
                            router.path.append(.createAccount)
                        }
                    }
                    .padding(.bottom, 20)
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
            .navigationDestination(for: Destination.self) { destination in
                ViewFactory.viewForDestination(destination)
            }
        }
        .environmentObject(router)
    }
}
