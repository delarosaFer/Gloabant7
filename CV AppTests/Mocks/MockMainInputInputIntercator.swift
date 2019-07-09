//
//  MainInputIntercator.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/14/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit
@testable import CV_App

class MockMainInputInteractor: MainInteractor {
    
    private(set) var fetchUserInfoCalled = 0
    
     override func fetchUserInfo(endpoint: String) {
        self.fetchUserInfoCalled += 1
    }
    
    
}
