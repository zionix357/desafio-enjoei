//
//  desafio_enjoeiUITests.swift
//  desafio-enjoeiUITests
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import XCTest

class desafio_enjoeiUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() { }

    func testEnjoei() {
        let tabbar = app.tabBars["tabbar"]
        tabbar.buttons["search"].tap()
        tabbar.buttons["upload"].tap()
        tabbar.buttons["inbox"].tap()
        tabbar.buttons["profile"].tap()
        tabbar.buttons["home"].tap()
        
        let collectionView = app.collectionViews["collectionView"]
        
        let firstCell = collectionView.cells.element(boundBy: 0)
        let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 3))
        start.press(forDuration: 0.1, thenDragTo: finish)
        
        let _ = scrollTo(cellIdentifier: "test-15", collectionViewElement: collectionView)
        
        collectionView.cells.firstMatch.tap()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    func scrollTo(cellIdentifier: String, collectionViewElement: XCUIElement, scrollUp: Bool = false, fullyVisible: Bool = false) -> Bool {
        var rtn = false
        var lastMidCellID = ""
        var lastMidCellRect = CGRect()
        
        var currentMidCell = collectionViewElement.cells.element(boundBy: collectionViewElement.cells.count / 2)
        
        while (lastMidCellID != currentMidCell.identifier || !lastMidCellRect.equalTo(currentMidCell.frame)) {
            
            if (collectionViewElement.cells.matching(identifier: cellIdentifier).count > 0 && collectionViewElement.cells[cellIdentifier].exists && collectionViewElement.cells[cellIdentifier].isHittable) {
                rtn = true
                break;
            }
            
            lastMidCellID = currentMidCell.identifier
            lastMidCellRect = currentMidCell.frame
            
            if (scrollUp) {
                collectionViewElement.coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.4)).press(forDuration: 0.01, thenDragTo: collectionViewElement.coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.9)))
            }
            else {
                collectionViewElement.coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.9)).press(forDuration: 0.01, thenDragTo: collectionViewElement.coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.4)))
            }
            
            currentMidCell = collectionViewElement.cells.element(boundBy: collectionViewElement.cells.count / 2)
        }
        
        if (fullyVisible) {
            let cell = collectionViewElement.cells[cellIdentifier]
            let scrollDistance = (cell.frame.height / 2) / collectionViewElement.frame.height
            
            while (!collectionViewElement.frame.contains(cell.frame)) {
                if (cell.frame.minY < collectionViewElement.frame.minY) {
                    collectionViewElement.coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.5)).press(forDuration: 0.01, thenDragTo: collectionViewElement.coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.5 + scrollDistance)))
                }
                else {
                    collectionViewElement.coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.5)).press(forDuration: 0.01, thenDragTo: collectionViewElement.coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.5 - scrollDistance)))
                }
            }
        }
        return rtn
    }
}
