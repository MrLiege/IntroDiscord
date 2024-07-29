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

struct SnackViewModifier: ViewModifier {
    
    @Binding var isShowingSnack: Bool
    
    let title: String
    
    func body(content: Content) -> some View {
        content.overlay(alignment: .top) {
            if isShowingSnack {
                SnackView(text: title)
                    .transition(.slide)
            }
        } .onChange(of: isShowingSnack, perform: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeIn(duration: 0.4)) {
                    isShowingSnack = false
                }
            }
        })
    }
}

extension View {
    func snack(isShowingSnack: Binding<Bool>, title: String) -> some View {
        self .modifier(SnackViewModifier(isShowingSnack: isShowingSnack, title: title))
    }
}

#Preview {
    SnackView(text: "Text")
}
