//
//  CardValidator.swift
//  Set
//
//  Created by Siddiqui, Arham J on 10/15/18.
//  Copyright © 2018 Siddiqui, Arham J; Eswaran, Pranav V. All rights reserved.
//

import Foundation

struct CardValidator {
    let board: Board
    
    func isValidSet() -> Bool {
        print(board.selectedCards)
        return allEqualOrAllDifferent(Num.self) && allEqualOrAllDifferent(Shape.self) && allEqualOrAllDifferent(Color.self) && allEqualOrAllDifferent(Fill.self)
    }
    
    private func allEqualOrAllDifferent<T:Attribute>(_ attribute: T.Type) -> Bool {
        return allAttributesSame(T.self) || allAttributesDifferent(T.self)
    }
    
    private func allAttributesSame<T:Attribute>(_ attribute: T.Type) -> Bool {
        if attribute is Num.Type {
            return board.selectedCards[0].num == board.selectedCards[1].num && board.selectedCards[1].num == board.selectedCards[2].num
        } else if attribute is Shape.Type {
            return board.selectedCards[0].shape == board.selectedCards[1].shape && board.selectedCards[1].shape == board.selectedCards[2].shape
        } else if attribute is Color.Type {
            return board.selectedCards[0].color == board.selectedCards[1].color && board.selectedCards[1].color == board.selectedCards[2].color
        } else if attribute is Fill.Type {
            return board.selectedCards[0].fill == board.selectedCards[1].fill && board.selectedCards[1].fill == board.selectedCards[2].fill
        }
        
        return false
    }
    
    private func allAttributesDifferent<T:Attribute>(_ attribute: T.Type) -> Bool {
        
        if attribute is Num.Type {
            return board.selectedCards[0].num != board.selectedCards[1].num && board.selectedCards[0].num != board.selectedCards[2].num && board.selectedCards[1].num != board.selectedCards[2].num
        } else if attribute is Shape.Type {
            return board.selectedCards[0].shape != board.selectedCards[1].shape && board.selectedCards[0].shape != board.selectedCards[2].shape && board.selectedCards[1].shape != board.selectedCards[2].shape
        } else if attribute is Color.Type {
            return board.selectedCards[0].color != board.selectedCards[1].color && board.selectedCards[0].color != board.selectedCards[2].color && board.selectedCards[1].color != board.selectedCards[2].color
        } else if attribute is Fill.Type {
            return board.selectedCards[0].fill != board.selectedCards[1].fill && board.selectedCards[0].fill != board.selectedCards[2].fill && board.selectedCards[1].fill != board.selectedCards[2].fill
        }
        
        return false
    }
}
