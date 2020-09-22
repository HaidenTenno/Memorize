//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Петр Тартынских  on 17.09.2020.
//  Copyright © 2020 Петр Тартынских . All rights reserved.
//

import Foundation

struct MemoryGameModel<CardContent: Equatable> {
    
    var cards: [Card]
    
    var facedUpCardIndex: Int? {
        get {
            // Вернуть индекс единственной открытой карты
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            // При выборе новой карты она переворачивается
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(pairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<pairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        #if DEBUG
        print("Card chosen: \(card)")
        #endif
        if let chosenIdex: Int = cards.firstIndex(matching: card), !cards[chosenIdex].isFaceUp, !cards[chosenIdex].isMatched {
            // Если ранее была выбрана карта
            if let potentialMatchIndex = facedUpCardIndex {
                // Если у текущей карты и ранее выбранной совпадает содержимое
                if cards[chosenIdex].content == cards[potentialMatchIndex].content {
                    // Текущая и ранне вбранная помечаются как отмеченные
                    cards[chosenIdex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                // Текущая карта переворачивается
                cards[chosenIdex].isFaceUp = true
            } else {
                facedUpCardIndex = chosenIdex
            }
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        // MARK: Identifiable
        var id: Int
    }
}
