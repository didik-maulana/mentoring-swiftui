//
//  RegisterScreen.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 14/08/22.
//

import SwiftUI

struct RegisterScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("back")
                        .resizable()
                        .frame(
                            width: 40,
                            height: 40,
                            alignment: .leading)
                        .padding(.top, 24)
                }

                Text("Sign Up")
                    .font(.latoBold(fontSize: 40))
                    .foregroundColor(.titleColor)
                    .padding(.top, 40)
                
                Text("We are happy to see you again. To use your account, you should login first.")
                    .font(.latoRegular(fontSize: 14))
                    .foregroundColor(.subtitleColor)
                    .padding(.top, 13)
                    .padding(.bottom, 44)
                
                VStack(alignment: .leading, spacing: 24) {
                    TextField("Name", text: $name)
                        .font(.latoRegular(fontSize: 14))
                        .foregroundColor(.textFieldColor)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                        .background(Color.textFieldBackground)
                        .cornerRadius(20)
                        .keyboardType(.alphabet)
                    
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
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .font(.latoRegular(fontSize: 14))
                        .foregroundColor(.textFieldColor)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                        .background(Color.textFieldBackground)
                        .cornerRadius(20)
                }
                
                PrimaryButton(title: "Sign Up") {
                    // TODO: Implementation Sign Up
                }
                .padding(.top, 44)
            }
            .padding(.horizontal, 27)
            .navigationBarHidden(true)
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
