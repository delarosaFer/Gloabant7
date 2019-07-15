import XCTest

class UserInfoViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    // MARK: - Test existence
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
            XCTFail(Fail.notView.rawValue)
        }
    }

    // MARK: - Test the More Information button
    func testMoreInformationButton() {
        app.buttons[AccessibilityIdentifiers.moreInfo.rawValue].tap()
        let myCareerNavigationBar = app.navigationBars[AccessibilityIdentifiers.myCareerNavBar.rawValue]
        XCTAssert(myCareerNavigationBar.waitForExistence(timeout: 1))
    }
    
    // MARK: - Test the content of the user name label
    func testMoreUserNameContent() {
        let userNameLabel = app.staticTexts[AccessibilityIdentifiers.userNameLabel.rawValue]
        XCTAssertNotNil(userNameLabel)
    }
    
    func testReturnAnimation() {
        app/*@START_MENU_TOKEN@*/.buttons["moreInfoButton"]/*[[".buttons[\"+\"]",".buttons[\"moreInfoButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.tables.containing(.other, identifier:"Studies").element/*[[".tables.containing(.other, identifier:\"NetCS\").element",".tables.containing(.other, identifier:\"Globant\").element",".tables.containing(.other, identifier:\"Studies\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
    app.navigationBars["myCareerNavigationBar"].buttons["UserInfoViewController"].tap()
        
    }
}
