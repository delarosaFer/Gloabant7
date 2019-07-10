//
//  MainPresenterTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import XCTest
@testable import CV_App

class MainPresenterTests: XCTestCase{
    var presenter: MainPresenter?
    let mockInteractor = MockMainInputInteractor()
    let mockRouter = MockMainRouter()
    var mockView = MockMainView()
    let failText = NSLocalizedString("Error test", comment: "")
    let data1 = UserResult(response: UserResponse(userInfo: UserInfo(userName: "Test", age: "22", cellphone: "0000000", email: "test@globant.com", imageURL: "test.com", linkedInURL: "test.com")))
    
    override func setUp() {
        super.setUp()
        presenter = MainPresenter()
        presenter?.interactor = mockInteractor
        presenter?.router = mockRouter
        mockView = MockMainView()
        presenter?.view = mockView
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShowUserInfoSuccess(){
        presenter?.userFeteched(user: data1)
        XCTAssert(mockView.showUserInfoCalled == 1, failText)
    }
    
    func testShowUserInfoFailed(){
        presenter?.userFetchFailed()
        XCTAssert(mockView.showUserInfoFailedCalled == 1, failText)
    }
    
    func testUpdateViewSuccess(){
        presenter?.updateView()
        XCTAssert(mockInteractor.fetchUserInfoCalled == 1, failText)
    }
    
    func testMyCareerPressed(){
        presenter?.myCareerPressed()
        XCTAssert(mockRouter.pushMyCareerCalled == 1, failText)
    }
}
