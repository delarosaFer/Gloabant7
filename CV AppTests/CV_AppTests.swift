//
//  CV_AppTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 5/31/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import XCTest
@testable import CV_App

class CV_NetworkLayer: XCTestCase {
    var interactor: AboutMeInteractor?
    override func setUp() {
        interactor = AboutMeInteractor()
    }
    
    func testUserNetworkRequestSuccess(){
        //given
        let expectation = XCTestExpectation(description: NSLocalizedString("Request success", comment: "nil"))
        
        // when
        Request.shared.request(EndPoint.userInfo.rawValue, entity: UserResult.self, completionHandler: { fetchResult in
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
}


