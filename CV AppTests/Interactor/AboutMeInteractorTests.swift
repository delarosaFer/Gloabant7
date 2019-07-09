//
//  AboutMeInteractorTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation

import XCTest
@testable import CV_App

class AboutMeInteractorTests: XCTestCase{
    
    func testFetchAboutMeSuccess(){
        //given
        let expectationText = NSLocalizedString("Fetch success", comment: "nil")
        let expectation = XCTestExpectation(description: expectationText )
        // when
        Request.shared.request(Constants.Endpoints.aboutMe, entity: AboutMeResult.self, completionHandler: { fetchResult in
            switch fetchResult {
            // then
            case .success:
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        })
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testFetchUserFailed(){
        //given
        let expectationText = NSLocalizedString("Fetch failed", comment: "")
        let expectation = XCTestExpectation(description: expectationText)
        // when
        Request.shared.request("nil", entity: AboutMeResult.self, completionHandler: { fetchResult in
            switch fetchResult {
            // then
            case .success:
                XCTFail()
            case .failure:
                expectation.fulfill()
            }
        })
        wait(for: [expectation], timeout: 3.0)
    }
}
