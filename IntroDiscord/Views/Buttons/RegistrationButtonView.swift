//
//  RegistrationButtonView.swift
//  IntroDiscord
//
//  Created by Artyom Petrichenko on 28.07.2024.
//

import SwiftUI

struct RegistrationButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Зарегистрироваться")
        }
        .buttonStyle(RoundedButtonStyle(titleColor: .black, backgroundColor: .white))
    }
}

//#Preview {
//    RegistrationButtonView()
//}
