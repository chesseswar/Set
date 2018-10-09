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
    
    init() {
        cardsOnBoard = []
    }
    
    func select(_ row: Row, _ col: Column) -> Board {
        return self
    }
}
