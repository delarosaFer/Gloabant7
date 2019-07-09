//
//  Constants.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

class Constants{
    //Base URL for the API request
    public static let url = Bundle.main.object(forInfoDictionaryKey: "URLRequest") as! String
    
    //Storyboars names
    struct StoryboardNames {
        static let cvInformation = "UserInfoViewController"
        static let cvAboutMe = "CVAboutTableViewController"
        static let cvMyCareer = "MyCareerTableViewController"
        static let cvMyAchivements = "AchivementsTableViewController"
    }
    //Endpoints names 
    struct Endpoints {
        static let userInfo = "120xcf"
        static let myCareer = "e5unb"
    }
}
