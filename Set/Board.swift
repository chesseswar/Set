//
//  Board.swift
//  Set
//
//  Created by Eswaran, Pranav V on 10/9/18.
//  Copyright © 2018 Siddiqui, Arham J; Eswaran, Pranav V. All rights reserved.
//

import Foundation

struct Board {
    var cardsOnBoard: [[Card]] {
        var rows: [[Card]] = []
        let generator = CardGenerator()
        for row in 0...2 {
            rows.append([])
            for _ in 1...4 {
                rows[row].append(generator.randomCard)
            }
        }
        return rows
    }
    
    var discardedCards: [Card] = []
    var selectedCards: [Card] = []
    
    func select(_ row: Row, _ col: Column) {
        
    }
}
