//
//  AboutMeRouterTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//
import XCTest
@testable import CV_App

class AboutMeRouterTests: XCTestCase{
    var router = AboutMeRouter()
    
    override func setUp() {
        super.setUp()
    }
    // MARK: - Integration Test
    func testCreateModuleSuccess(){
        let v = AboutMeRouter.createModule()
        // create an expectation…
        let expectation = XCTestExpectation(description: "Module Created")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        // then
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(v is CVAboutTableViewController)
    }
    
}
