//
//  AboutMeViewTest.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import XCTest
@testable import CV_App

class AboutMeViewTest: XCTestCase{
    
    var view: CVAboutTableViewController?
    var mockAboutMeView: MockAboutMeView?
    
    override func setUp() {
        
        let storyboard = UIStoryboard(name: Storyboard.cvAboutMe.rawValue, bundle: nil)
        mockAboutMeView = MockAboutMeView()
        view = storyboard.instantiateViewController(withIdentifier: Controller.cvAboutMe.rawValue) as? CVAboutTableViewController
        
        self.view?.loadView()
        self.view?.viewDidLoad()
    }
    
    func testShowAboutMeShowCorrectData(){
        let expectation = XCTestExpectation(description: NSLocalizedString("Request success", comment: "nil"))
        
        let aboutMe = AboutMeResult(response: Response(AboutMe: AboutMe(about: abort(titleSection: "About Title", text: "text", rowsInSection: 2), hobbies: About(titleSection: "Hobbies Title", text: "text", rowsInSection: 1), Skills: Skills(titleSection: "Skills title", resume: "resume", rowsInSection: 3), sections: 3)))
        
        guard (view?.showAboutMe(with: aboutMe)) != nil else {
            XCTFail("Theres was an error showing user info data")
            return
        }
        expectation.fulfill()
    }
    
    func testTableviewAboutMeExist(){
        let storyboard = UIStoryboard(name: Storyboard.cvAboutMe.rawValue, bundle: nil)
        view = storyboard.instantiateViewController(withIdentifier: Controller.cvAboutMe.rawValue) as? CVAboutTableViewController
        view?.loadView()
        
        XCTAssertNotNil(view?.tableView)
    }
}
