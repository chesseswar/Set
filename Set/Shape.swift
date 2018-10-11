//
//  Color.swift
//  Set
//
//  Created by Eswaran, Pranav V on 10/3/18.
//  Copyright © 2018 Siddiqui, Arham J; Eswaran, Pranav V. All rights reserved.
//

import Foundation

enum Shape: UInt32 {
    case oval
    case squiggle
    case diamond
    
    static func random() -> Shape {
        return Shape(rawValue: arc4random_uniform(diamond.rawValue+1))!
    }
}
