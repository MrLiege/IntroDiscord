//
//  ButtonStyle+Ext.swift
//  IntroDiscord
//
//  Created by Artyom Petrichenko on 28.07.2024.
//

import Foundation
import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    var titleColor: Color
    var backgroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .foregroundColor(titleColor)
            .background(backgroundColor)
            .clipShape(Capsule())
            .padding(.horizontal, 55)
            .animation(.easeInOut(duration: 0.4), value: configuration.isPressed)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .brightness(configuration.isPressed ? 0.3 : 0)
            .shadow(radius: configuration.isPressed ? 25: 0)
    }
}
