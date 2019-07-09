//
//  UserRouterTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import XCTest
@testable import CV_App

class UserRouterTests: XCTestCase{
    var router = UserRouter()
    var subject: MainInteractor?
    
    override func setUp() {
        super.setUp()
    }
    // MARK: - Integration Test
    func testCreateModuleSuccess(){
        let nv = UserRouter.createModule()
        let moduleCreatedText = XCTestExpectation(description: "Module Created")
        // create an expectation…
        let expectation = moduleCreatedText
        // …then fulfill it asynchronously
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        // then
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(nv.topViewController is UserInfoViewController)
    }
    
    func testAboutMeVCWhenPresented(){
        let _ = AboutMeRouter.createModule()
        router.pushAboutMe()
        
    }
    
    func testMyCareerVCWhenPresented(){
        let _ = AboutMeRouter.createModule()
        router.pushAboutMe()
        
    }
    
    func testAchivementsVCWhenPresented(){
        let _ = AboutMeRouter.createModule()
        router.pushAboutMe()
        
    }
}
