//
//  LoginViewModel.swift
//  TryMapKit
//
//  Created by Irvan P. Saragi on 23/11/24.
//

import SwiftUI


class LoginViewModel: ObservableObject {
    @Published var password = ""
    @Published var confirmPassword = ""
    
    var passwordsMatch: Bool {
            return password == confirmPassword && !password.isEmpty && !confirmPassword.isEmpty
        }
    var confirmPasswordBorderColor: Color {
        return passwordsMatch ? Color.green : Color.thirdColor
    }
}
