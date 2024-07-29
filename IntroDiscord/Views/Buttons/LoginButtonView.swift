//
//  LoginButtonView.swift
//  IntroDiscord
//
//  Created by Artyom Petrichenko on 28.07.2024.
//

import SwiftUI

struct LoginButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Вход")
        }
        .buttonStyle(RoundedButtonStyle(titleColor: .white, backgroundColor: Color("loginButtonColor")))
        .padding(.vertical, 15)
    }
}

//#Preview {
//    LoginButtonView()
//}
