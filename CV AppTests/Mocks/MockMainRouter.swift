//
//  MockMainRouter.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/14/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit
@testable import CV_App

class MockMainRouter: UserRouter{
    private(set) var view: UIViewController?
    private(set) var pushMyCareerCalled = 0
    
    override func pushMyCareer() {
        self.pushMyCareerCalled += 1
    }
}
