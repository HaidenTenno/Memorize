//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Петр Тартынских  on 17.09.2020.
//  Copyright © 2020 Петр Тартынских . All rights reserved.
//

import Foundation

struct MemoryGameModel<CardContent> {
    var cards: [Card]
    
    init(pairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<pairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    func choose(card: Card) {
        print("Card chosen: \(card)")
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        
        // MARK: Identifiable
        var id: Int
    }
}
