//
//  AboutMePresenterTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//
import XCTest
@testable import CV_App

class AboutMePresenterTests: XCTestCase{
    var presenter: AboutMePresenter?
    let mockInteractor = MockAboutMeInputInteractor()
    let mockRouter = MockAboutMeRouter()
    var mockView = MockAboutMeView()
    let failText = NSLocalizedString("Error test", comment: "")
    let aboutMe = AboutMeResult(response: Response(AboutMe: AboutMe(about: About(titleSection: "About Title", text: "text", rowsInSection: 2), hobbies: About(titleSection: "Hobbies Title", text: "text", rowsInSection: 1), Skills: Skills(titleSection: "Skills title", resume: "resume", rowsInSection: 3), sections: 3)))
    override func setUp() {
        super.setUp()
        presenter = AboutMePresenter()
        presenter?.interactor = mockInteractor
        presenter?.router = mockRouter
        mockView = MockAboutMeView()
        presenter?.view = mockView
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShowAboutMeSuccess(){
        presenter?.aboutMeFeteched(aboutMe: aboutMe)
        XCTAssert(mockView.showAboutMeCalled == 1, failText)
    }
    
    func testShowUserInfoFailed(){
        presenter?.aboutMeFetchFailed()
        XCTAssert(mockView.showAboutMeFailedCalled == 1, failText)
    }
    
    func testUpdateViewSuccess(){
        presenter?.updateView()
        XCTAssert(mockInteractor.fetchAboutMeCalled == 1, failText)
    }
    
}
