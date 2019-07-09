//
//  MockMainView.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/14/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit
@testable import CV_App

class MockMainView: UserInfoViewController{
   
    private(set) var showUserInfoCalled = 0
    private(set) var showUserInfoFailedCalled = 0
    
    override func showUserInfo(with user: UserResult) {
        
        self.showUserInfoCalled += 1
    }
    
    override func showNetworkingError() {
        self.showUserInfoFailedCalled += 1
    }
}
