//
//  ContentView.swift
//  IntroDiscord
//
//  Created by Artyom Petrichenko on 26.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            
            LogoAndTextsView(subText: viewModel.subtitleText)
                .onReceive(timer, perform: { _ in
                    viewModel.currentIndex =  Int.random(in: 0...2)
                    switch viewModel.currentIndex {
                    case 0:
                        viewModel.subtitleText = .text1
                    case 1:
                        viewModel.subtitleText = .text2
                    case 2:
                        viewModel.subtitleText = .text3
                    default:
                        viewModel.subtitleText = .text1
                    }
                })
            
            RegAndLogButton(action: {
                viewModel.showSnack(with: "Не удалось зарегистрироваться")
            }, titleButton: TitleButton.login)
            .padding(.vertical, 15)
            RegAndLogButton(action: {
                viewModel.showSnack(with: "Не удалось войти")
            }, titleButton: TitleButton.registration)
            .padding(.bottom, 25)
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .background(.blue)
        .snack(isShowingSnack: $viewModel.isShowingSnack, title: viewModel.snackText)
    }
}

#Preview {
    ContentView()
}
