//
//  CV_AppUITests.swift
//  CV AppUITests
//
//  Created by Jordy Xavier Pazaran Reyes on 5/31/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import XCTest

class MyCareerTableViewControllerUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        
    }
    
    // MARK: - Test display the navegation bar
    var isDisplayingMyCareerNavegationBar: Bool {
        return app.navigationBars[AccessibilityIdentifiers.myCareerNavBar.rawValue].exists
    }
    
    func testDisplayTheNavBar() {
        app.buttons[AccessibilityIdentifiers.moreInfo.rawValue].tap()
        XCTAssertTrue(isDisplayingMyCareerNavegationBar)
    }
    

}
