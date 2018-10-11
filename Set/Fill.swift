//
//  Fill.swift
//  Set
//
//  Created by Eswaran, Pranav V on 10/3/18.
//  Copyright © 2018 Siddiqui, Arham J; Eswaran, Pranav V. All rights reserved.
//

import Foundation

enum Fill: UInt32 {
    case open
    case lined
    case solid
    
    static func random() -> Fill {
        return Fill(rawValue: arc4random_uniform(solid.rawValue+1))!
    }
}
