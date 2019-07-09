//
//  MockAboutMeInputInteractor.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit
@testable import CV_App

class MockAboutMeInputInteractor: AboutMeInteractor {
    
    private(set) var fetchAboutMeCalled = 0
    
    override func fetchAboutMe(endpoint: String) {
        self.fetchAboutMeCalled += 1
    }
    
}
