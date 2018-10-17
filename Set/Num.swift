//
//  Num.swift
//  Set
//
//  Created by Eswaran, Pranav V on 10/17/18.
//  Copyright © 2018 Siddiqui, Arham J; Eswaran, Pranav V. All rights reserved.
//

import Foundation

enum Num: UInt32, Attribute {
    case one
    case two
    case three
    
    static func random() -> Num {
        return Num(rawValue: arc4random_uniform(three.rawValue+1))!
    }
}
