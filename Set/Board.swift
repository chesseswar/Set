//
//  Board.swift
//  Set
//
//  Created by Eswaran, Pranav V on 10/9/18.
//  Copyright © 2018 Siddiqui, Arham J; Eswaran, Pranav V. All rights reserved.
//

import Foundation

struct Board {
    var cardsOnBoard: [[Card]]
    var discardedCards: [Card] = []
    var selectedCards: [Card] = []
    
    init() {
        let generator = CardGenerator()
        cardsOnBoard = generator.get2DArrayOfRandomCards()
    }
    
    private func getCard(_ row: Row, _ col: Column) -> Card {
        return cardsOnBoard[Int(row.rawValue)][Int(col.rawValue)]
    }
    
    mutating func tapCard(_ row: Row, _ col: Column) {
        let cardOnBoard = getCard(row, col)
        if selectedCards.contains(cardOnBoard) {
            deselect(row, col)
        } else {
            select(row, col)
        }
    }
    
    private mutating func deselect(_ row: Row, _ col: Column) {
        let card = getCard(row, col)
        
        selectedCards.remove(at: selectedCards.index(of: card)!)
    }
    
    private mutating func select(_ row: Row, _ col: Column) {
        let card = getCard(row, col)
        
        selectedCards.append(card)
    }
}
