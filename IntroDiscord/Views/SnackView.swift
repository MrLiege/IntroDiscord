//
//  SnackView.swift
//  IntroDiscord
//
//  Created by Artyom Petrichenko on 28.07.2024.
//

import Foundation
import SwiftUI

struct SnackView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 290, height: 115)
            .background(Color.white.opacity(0.8).blur(radius: 10))
            .cornerRadius(25)
            .shadow(radius: 10)
    }
}

#Preview {
    SnackView(text: "Texts")
}
