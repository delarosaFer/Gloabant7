//
//  MockAboutMeView.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit
@testable import CV_App

class MockAboutMeView: CVAboutTableViewController{
    private(set) var aboutMe: AboutMeResult?
    private(set) var showAboutMeCalled = 0
    private(set) var showAboutMeFailedCalled = 0
    
    override func showAboutMe(with aboutMe: AboutMeResult) {
        self.aboutMe = aboutMe
        self.showAboutMeCalled += 1
    }
    
    override func showNetworkingError() {
        self.showAboutMeFailedCalled += 1
    }
}
