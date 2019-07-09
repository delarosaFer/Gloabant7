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
        Request.shared.request("75db75d855f4805cbdc4fcf9ee8670db/raw/cc7a939cc8082191ea93f4f1aa866de6021ee850/UserInfo", entity: UserResult.self, completionHandler: { fetchResult in
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


