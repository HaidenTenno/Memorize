//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Петр Тартынских  on 17.09.2020.
//  Copyright © 2020 Петр Тартынских . All rights reserved.
//

import SwiftUI

class EmojiMemoryGameViewModel {
    private var memoryGameModel: MemoryGameModel<String> = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        let emojis = ["😀", "🤪", "😇", "😎"]
        return MemoryGameModel(pairs: emojis.count) { pairIndex in emojis[pairIndex] }
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

struct EmojiMemoryGameViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
