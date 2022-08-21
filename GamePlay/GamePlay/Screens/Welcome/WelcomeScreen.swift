//
//  WelcomeScreen.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 14/08/22.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            
            VStack(alignment: .center, spacing: 0) {
                Image("basketballplayer")
                    .resizable()
                    .frame(
                        width: 277,
                        height: 277,
                        alignment: .center)
                
                Text("Thank you!")
                    .font(.latoBold(fontSize: 40))
                    .foregroundColor(.titleColor)
                    .padding(.top, 36)
                
                Text("Thank you for joining us. Please check your email for confirmation!")
                    .font(.latoRegular(fontSize: 14))
                    .foregroundColor(.subtitleColor)
                    .multilineTextAlignment(.center)
                    .padding(.top, 12)
            }
            .padding(.horizontal, 50)
            
            Spacer()
            
            NavigationLink(destination: MainTabView(), label: {
                Text("Okay, cool")
                    .foregroundColor(.white)
                    .padding(.vertical, 24)
                    .frame(maxWidth: .infinity)
                    .background(Color.buttonColor)
                    .font(.latoRegular(fontSize: 16))
                    .cornerRadius(20)
            })
            .padding(.horizontal, 32)
            .padding(.bottom, 60)
        }
        .navigationBarHidden(true)
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
