//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Петр Тартынских  on 17.09.2020.
//  Copyright © 2020 Петр Тартынских . All rights reserved.
//

import SwiftUI

class EmojiMemoryGameViewModel: ObservableObject {
    @Published private var memoryGameModel: MemoryGameModel<String> = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        let numberOfPairs = Int.random(in: 2...5)
        let emojis = ["😀","😜","🤓","😎","🥶","🤗","👹","👻","🎃","🤖","🤡","😈","🦁","🐵","🐸","🐯","🐹"].shuffled()
        return MemoryGameModel(pairs: numberOfPairs) { pairIndex in emojis[pairIndex] }
    }
    
    // MARK: - Access to the Model
    var cards: [MemoryGameModel<String>.Card] {
        memoryGameModel.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGameModel<String>.Card) {
        memoryGameModel.choose(card: card)
    }
    
}
