//
//  Board.swift
//  Set
//
//  Created by Eswaran, Pranav V on 10/9/18.
//  Copyright © 2018 Siddiqui, Arham J; Eswaran, Pranav V. All rights reserved.
//

import Foundation

class Board {
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
    
    func resetSelections() {
        selectedCards = []
    }
    
    func tapCard(_ row: Row, _ col: Column) {
        let cardOnBoard = getCard(row, col)
        if selectedCards.contains(cardOnBoard) {
            deselect(row, col)
        } else {
            do {
                try select(row, col)
            } catch SetError.invalidSelection {
                print("Invalid selection exception occured.")
            } catch {
                print("Anonymous exception occured")
            }
        }
    }
    
    private func deselect(_ row: Row, _ col: Column) {
        let card = getCard(row, col)
        selectedCards.remove(at: selectedCards.index(of: card)!)
    }
    
    private func select(_ row: Row, _ col: Column) throws {
        guard canSelect() else {
            throw SetError.invalidSelection
        }
        
        let card = getCard(row, col)
        selectedCards.append(card)
    }
    
    private func canSelect() -> Bool {
        return selectedCards.count < 3
    }
}
