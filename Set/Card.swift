//
//  Card.swift
//  Set
//
//  Created by Eswaran, Pranav V on 10/3/18.
//  Copyright © 2018 Siddiqui, Arham J; Eswaran, Pranav V. All rights reserved.
//

import Foundation

struct Card: Equatable {
    let num: Num
    let shape: Shape
    let color: Color
    let fill: Fill
    
    static func == (card1: Card, card2: Card) -> Bool {
        return card1.num == card2.num
            && card1.shape == card2.shape
            && card1.color == card2.color
            && card1.fill == card2.fill
    }
}

