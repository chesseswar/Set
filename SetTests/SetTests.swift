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
    var cardsOnBoard: [[Card]] = []
    
    override func setUp() {
        super.setUp()
        cardsOnBoard = [
            [Card(num: Num.one, shape: Shape.diamond, color: Color.green, fill: Fill.lined), Card(num: Num.three, shape: Shape.oval, color: Color.red, fill: Fill.open), Card(num: Num.two, shape: Shape.diamond, color: Color.green, fill: Fill.open), Card(num: Num.one, shape: Shape.oval, color: Color.red, fill: Fill.open)],
            [Card(num: Num.one, shape: Shape.oval, color: Color.green, fill: Fill.open), Card(num: Num.one, shape: Shape.diamond, color: Color.red, fill: Fill.solid), Card(num: Num.three, shape: Shape.diamond, color: Color.blue, fill: Fill.solid), Card(num: Num.one, shape: Shape.diamond, color: Color.red, fill: Fill.lined)],
            [Card(num: Num.one, shape: Shape.oval, color: Color.blue, fill: Fill.open), Card(num: Num.two, shape: Shape.oval, color: Color.green, fill: Fill.solid), Card(num: Num.one, shape: Shape.squiggle, color: Color.blue, fill: Fill.solid), Card(num: Num.two, shape: Shape.squiggle, color: Color.green, fill: Fill.lined)]
        ]
        game.board.cardsOnBoard = cardsOnBoard
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAttributesOfCard() {
        let card = Card(num: Num.three, shape: Shape.oval, color: Color.blue, fill: Fill.open)
        XCTAssertEqual(card.num, Num.three)
    }
    
    func testExampleGame() {
        //game.setUp()
        game.board.tapCard(Row.top, Column.col_1)
        game.board.tapCard(Row.middle, Column.col_4)
        game.board.tapCard(Row.bottom, Column.col_3)
            // if one selects more than 3 cards, throw exception
        //game.validateSet()
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
    
    func testSelectedCardsCount() {
        game.board.tapCard(Row.top, Column.col_1)
        XCTAssertEqual(game.board.selectedCards.count, 1)
        game.board.tapCard(Row.top, Column.col_2)
        XCTAssertEqual(game.board.selectedCards.count, 2)
        game.board.tapCard(Row.top, Column.col_3)
        XCTAssertEqual(game.board.selectedCards.count, 3)
        game.board.resetSelections()
        XCTAssertEqual(game.board.selectedCards.count, 0)
    }
    
    func testResetSelections() {
        game.board.tapCard(Row.top, Column.col_1)
        game.board.resetSelections()
        XCTAssertEqual(game.board.selectedCards.count, 0)
    }
    
    func testSelectingMoreThanThreeCards() {
        game.board.tapCard(Row.top, Column.col_1)
        game.board.tapCard(Row.middle, Column.col_2)
        game.board.tapCard(Row.bottom, Column.col_3)
        //XCTAssertThrowsError(game.board.tapCard(Row.bottom, Column.col_1))
    }
    
    func testValidSets() {
        game.board.tapCard(Row.top, Column.col_1)
        game.board.tapCard(Row.top, Column.col_4)
        game.board.tapCard(Row.bottom, Column.col_3)
        XCTAssertTrue(game.cardValidator.isValidSet())
        
        game.board.resetSelections()
        game.board.tapCard(Row.top, Column.col_3)
        game.board.tapCard(Row.middle, Column.col_3)
        game.board.tapCard(Row.middle, Column.col_4)
        XCTAssertTrue(game.cardValidator.isValidSet())
        
        game.board.resetSelections()
        game.board.tapCard(Row.top, Column.col_3)
        game.board.tapCard(Row.bottom, Column.col_2)
        game.board.tapCard(Row.bottom, Column.col_4)
        XCTAssertTrue(game.cardValidator.isValidSet())
        
        game.board.resetSelections()
        game.board.tapCard(Row.top, Column.col_4)
        game.board.tapCard(Row.middle, Column.col_1)
        game.board.tapCard(Row.bottom, Column.col_1)
        XCTAssertTrue(game.cardValidator.isValidSet())
        
        game.board.resetSelections()
        game.board.tapCard(Row.top, Column.col_4)
        game.board.tapCard(Row.middle, Column.col_3)
        game.board.tapCard(Row.bottom, Column.col_4)
        XCTAssertTrue(game.cardValidator.isValidSet())
    }
    
    func testInvalidSet() {
        game.board.tapCard(Row.bottom, Column.col_2)
        game.board.tapCard(Row.top, Column.col_3)
        game.board.tapCard(Row.middle, Column.col_4)
        XCTAssertFalse(game.cardValidator.isValidSet())
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
