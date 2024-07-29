//
//  LogoAndTextsView.swift
//  IntroDiscord
//
//  Created by Artyom Petrichenko on 28.07.2024.
//

import SwiftUI

struct LogoAndTextsView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            Image("iconDS")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 115)
//                .imageScale(.large)
//                .foregroundStyle(.tint)
            
            Group {
                Text("ДОБРО ПОЖАЛОВАТЬ В ")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                + Text("DISCORD")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.heavy)
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 25)
            
            Text(viewModel.subtitleText.rawValue)
                .foregroundStyle(.white)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 45)
            Spacer()
        }
    }
}

#Preview {
    LogoAndTextsView(viewModel: ContentViewModel())
}
