//
//  CV_AppUITests.swift
//  CV AppUITests
//
//  Created by Jordy Xavier Pazaran Reyes on 5/31/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//
import XCTest

class UserInfoViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        
    }
    
    func neededViewsExists() -> Bool {
        let topFirstTitle = app.staticTexts[AccessibilityIdentifiers.topFirstTitle.rawValue]
        let topSecondTitle = app.staticTexts[AccessibilityIdentifiers.topSecondTitle.rawValue]
        let userNameLabel = app.staticTexts[AccessibilityIdentifiers.userNameLabel.rawValue]
        let ageLabel = app.staticTexts[AccessibilityIdentifiers.ageLabel.rawValue]
        let cellphoneLabel = app.staticTexts[AccessibilityIdentifiers.cellphoneLabel.rawValue]
        let emailLabel = app.staticTexts[AccessibilityIdentifiers.emailLabel.rawValue]
        let aboutMeLabel = app.staticTexts[AccessibilityIdentifiers.aboutMeLabel.rawValue]
        let profileUserImage = app.images[AccessibilityIdentifiers.profileUserImage.rawValue]
        let moreInfoLabel = app.buttons[AccessibilityIdentifiers.moreInfo.rawValue]
        
        return topFirstTitle.exists && topSecondTitle.exists && userNameLabel.exists && ageLabel.exists && cellphoneLabel.exists && emailLabel.exists && aboutMeLabel.exists && profileUserImage.exists && moreInfoLabel.exists
    }
    
    func testAllExists() {
        if !neededViewsExists() {
            XCTFail("The initial views aren't on the view")
        }
    }
    
}
