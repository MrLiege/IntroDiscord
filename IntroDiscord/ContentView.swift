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
        Color.blue.edgesIgnoringSafeArea(.all).overlay(
            VStack {
                LogoAndTextsView(viewModel: viewModel)
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
                
                RegistrationButtonView(action: {
                    viewModel.showSnack(with: "Не удалось зарегистрироваться")
                })
                LoginButtonView(action: {
                    viewModel.showSnack(with: "Не удалось войти")
                })
            }
        ) .overlay(alignment: .top) {
            if viewModel.isShowingSnack {
                SnackView(text: viewModel.snackText)
                    .transition(.slide)
            }
        } .onChange(of: viewModel.isShowingSnack, perform: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeIn(duration: 0.4)) {
                    viewModel.isShowingSnack = false
                }
            }
        })
    }
}

#Preview {
    ContentView()
}
