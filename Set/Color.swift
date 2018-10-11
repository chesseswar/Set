//
//  Color.swift
//  Set
//
//  Created by Eswaran, Pranav V on 10/3/18.
//  Copyright © 2018 Siddiqui, Arham J; Eswaran, Pranav V. All rights reserved.
//

import Foundation

enum Color: UInt32 {
    case blue
    case red
    case green
    
    static func random() -> Color {
        return Color(rawValue: arc4random_uniform(green.rawValue+1))!
    }
}
