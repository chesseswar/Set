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
    
    mutating func select(_ row: Row, _ col: Column) {
        let rowIndex = Int(row.rawValue)
        let colIndex = Int(col.rawValue)
        
        selectedCards.append(cardsOnBoard[rowIndex][colIndex])
    }
}
