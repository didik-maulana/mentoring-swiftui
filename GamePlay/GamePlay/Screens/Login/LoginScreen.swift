//
//  LoginScreen.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 14/08/22.
//

import SwiftUI

struct LoginScreen: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Image("petcare")
                        .resizable()
                        .frame(
                            width: 234,
                            height: 234,
                            alignment: .leading)
                        .padding(.top, 53)
                        .padding(.bottom, 10)
                    
                    Text("Welcome back")
                        .font(.latoBold(fontSize: 40))
                        .foregroundColor(.titleColor)
                    
                    Text("We are happy to see you again. To use your account, you should login first.")
                        .font(.latoRegular(fontSize: 14))
                        .foregroundColor(.subtitleColor)
                        .padding(.top, 13)
                        .padding(.bottom, 44)
                    
                    VStack(alignment: .leading, spacing: 24) {
                        TextField("Email", text: $email)
                            .font(.latoRegular(fontSize: 14))
                            .foregroundColor(.textFieldColor)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 30)
                            .background(Color.textFieldBackground)
                            .cornerRadius(20)
                            .keyboardType(.emailAddress)
                        
                        SecureField("Password", text: $password)
                            .font(.latoRegular(fontSize: 14))
                            .foregroundColor(.textFieldColor)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 30)
                            .background(Color.textFieldBackground)
                            .cornerRadius(20)
                    }
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: RegisterScreen()) {
                            Text("Create account? Sign Up")
                                .font(.latoRegular(fontSize: 14))
                                .foregroundColor(.subtitleColor)
                        }
                    }
                    .padding(.top, 12)
                    
                    PrimaryButton(title: "Login") {
                        // TODO: Implementation Login
                    }
                    .padding(.top, 44)
                }
                .padding(.horizontal, 27)
                .navigationBarHidden(true)
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
