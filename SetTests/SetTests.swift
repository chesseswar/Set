//
//  SetTests.swift
//  SetTests
//
//  Created by Siddiqui, Arham J on 10/1/18.
//  Copyright © 2018 Siddiqui, Arham J. and Eswaran, Pranav V. All rights reserved.
//

import XCTest
@testable import Set


class SetTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAttributesOfCard() {
        let card = Card(num: 3, shape: Shape.oval, color: Color.blue, fill: Fill.open)
        XCTAssertEqual(card.num, 3)
    }
    
    func testExampleGame() {
        let game = Game()
        //game.setUp()
        game.board.select(Row.top, Column.col_1)
        game.board.select(Row.middle, Column.col_4)
        game.board.select(Row.bottom, Column.col_3)
            // if one selects more than 3 cards, throw exception
        game.validateSet()
    }
    
    func testRandomCard() {
        let gen = CardGenerator()
        let card = gen.randomCard
        XCTAssert(card.num >= 1 && card.num <= 3)
    }
    
    func testRandomBoard() {
        let board = Board()
        XCTAssertEqual(board.cardsOnBoard.count, 3)
        XCTAssertEqual(board.cardsOnBoard[0].count, 4)
    }
    
    func testGameSetUp() {
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
