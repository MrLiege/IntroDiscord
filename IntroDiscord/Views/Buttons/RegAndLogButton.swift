//
//  RegAndLogButton.swift
//  IntroDiscord
//
//  Created by Artyom Petrichenko on 29.07.2024.
//

import SwiftUI

enum TitleButton: String {
    case login = "Вход"
    case registration = "Зарегистрироваться"
    
    var titleColor: Color {
        switch self {
        case .login:
            return Color.white
        case .registration:
            return Color.black
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .login:
            return Color.loginButton
        case .registration:
            return Color.white
        }
    }
}

struct RegAndLogButton: View {
    var action: () -> Void
    var titleButton: TitleButton
    
    var body: some View {
        Button(action: action) {
            Text(titleButton.rawValue)
        }
        .buttonStyle(RoundedButtonStyle(titleColor: titleButton.titleColor, backgroundColor: titleButton.backgroundColor))
    }
}

#Preview {
    RegAndLogButton(action: {
        print("")
    }, titleButton: TitleButton.registration )
}
