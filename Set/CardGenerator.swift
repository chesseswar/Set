//
//  CardGenerator.swift
//  Set
//
//  Created by Eswaran, Pranav V on 10/9/18.
//  Copyright © 2018 Siddiqui, Arham J; Eswaran, Pranav V. All rights reserved.
//

import Foundation

struct CardGenerator {
    var randomCard: Card {
        get {
            let card = Card(num: Int(arc4random_uniform(3) + 1), shape: Shape.random(), color: Color.random(), fill: Fill.random())
            return card
        }
    }
    
    func get2DArrayOfRandomCards() -> [[Card]] {
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
}
