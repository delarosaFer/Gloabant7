//
//  MockAboutMeOutputInteractor.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit
@testable import CV_App

class MockAboutMeOutputIntercator: AboutMeOutputIntercatorProtocol{
    
    private(set) var aboutMe: AboutMeResult?
    private(set) var getAboutMeSuccessCalled = 0
    private(set) var getAboutMeFailCalled = 0
    
    func aboutMeFeteched(aboutMe: AboutMeResult) {
        self.aboutMe = aboutMe
        self.getAboutMeSuccessCalled += 1
    }
    
    func aboutMeFetchFailed() {
        self.getAboutMeFailCalled += 1
    }
}
