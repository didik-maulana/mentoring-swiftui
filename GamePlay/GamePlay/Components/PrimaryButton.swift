//
//  PrimaryButton.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 14/08/22.
//

import SwiftUI

struct PrimaryButton: View {
    
    var title: String
    var onTapButtonAction: () -> Void = {}
    
    var body: some View {
        Button(action: onTapButtonAction) {
            Text(title)
                .foregroundColor(.white)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(Color.buttonColor)
                .font(.latoBold(fontSize: 16))
                .cornerRadius(20)
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Login")
    }
}
