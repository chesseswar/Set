//
//  Game.swift
//  Set
//
//  Created by Eswaran, Pranav V on 10/9/18.
//  Copyright © 2018 Siddiqui, Arham J; Eswaran, Pranav V. All rights reserved.
//

import Foundation

struct Game {
    var board: Board
    let cardValidator: CardValidator
    
    init() {
        board = Board()
        cardValidator = CardValidator(board: board)
    }
}
