//
//  ContentViewModel.swift
//  IntroDiscord
//
//  Created by Artyom Petrichenko on 29.07.2024.
//

import Foundation

enum SubtitleText: String {
    case text1 = "Отдыхайте, играйте в игры или просто общайтесь. Коснитесь кнопки, чтобы начать!"
    case text2 = "Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться."
    case text3 = "Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона"
}

final class ContentViewModel: ObservableObject {
    @Published var isShowingSnack = false
    @Published var snackText: String = ""
    @Published var subtitleText: SubtitleText = .text1
    
    var currentIndex = 0
    
    func showSnack(with text: String) {
        self.snackText = text
        self.isShowingSnack = true
    }
}
