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
    
    var game: Game = Game()
    
    override func setUp() {
        super.setUp()
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
        //game.setUp()
        game.board.tapCard(Row.top, Column.col_1)
        game.board.tapCard(Row.middle, Column.col_4)
        game.board.tapCard(Row.bottom, Column.col_3)
            // if one selects more than 3 cards, throw exception
        game.validateSet()
    }
    
    func testRandomCard() {
        let gen = CardGenerator()
        let card = gen.randomCard
        XCTAssert(card.num >= 1 && card.num <= 3)
    }
    
    func testRandomBoard() {
        XCTAssertEqual(game.board.cardsOnBoard.count, 3)
        XCTAssertEqual(game.board.cardsOnBoard[0].count, 4)
    }
    
    func testFunctionalityOfCardsOnBoard() {
        let cards1 = game.board.cardsOnBoard
        let cards2 = game.board.cardsOnBoard
        XCTAssertEqual(cards1[0][0], cards2[0][0])
    }
    
    func testCardSelection() {
        let presumedSelection = game.board.cardsOnBoard[Int(Row.top.rawValue)][Int(Column.col_1.rawValue)]
        game.board.tapCard(Row.top, Column.col_1)
        let selection = game.board.selectedCards[0]
        XCTAssertEqual(presumedSelection, selection)
    }
    
    func testSelectingSameCard() {
        game.board.tapCard(Row.top, Column.col_1)
        game.board.tapCard(Row.top, Column.col_1)
        XCTAssertEqual(game.board.selectedCards.count, 0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
