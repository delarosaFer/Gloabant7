//
//  MainOutputIntercator.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/14/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit
@testable import CV_App

class MockMainOutputIntercator: MainOutputIntercatorProtocol{
    
    private(set) var user: UserResult?
    private(set) var getUserInfoSuccessCalled = 0
    private(set) var getUserInfoFailCalled = 0
    private(set) var getImageCalled = 0
     func userFeteched(user: UserResult) {
        self.user = user
        self.getUserInfoSuccessCalled += 1
    }
    
     func userFetchFailed() {
        self.getUserInfoFailCalled += 1
    }
    
    func dowloadedImage(_ data: Data) {
        self.getImageCalled += 1
    }
    
}
