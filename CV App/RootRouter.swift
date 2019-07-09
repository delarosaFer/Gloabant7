//
//  RootRouter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/6/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class RootRouter {
    
    func presentUserInfoScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = UserRouter.createModule()
    }
}
