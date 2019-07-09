//
//  Constants.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

public enum UserInfoStrings {
    case age
    case phone
    case email
    
    func getText() -> String {
        switch self {
        case .age:
            return NSLocalizedString("Title Age", comment: "")
        case .phone:
            return NSLocalizedString("Title Phone", comment: "")
        case .email:
            return NSLocalizedString("Title e-mail", comment: "")
        }
    }
}

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
        static let userInfo = "75db75d855f4805cbdc4fcf9ee8670db/raw/e66c53ac4f6e484d5b727c1adb3d38e721cdec8f/UserInfo"
        static let aboutMe = "b290f1f79adcbee0d716410e5862fa12/raw/f73751f9ab119f927317d0eaf8032884b40668b5/AboutMe"
        static let myCareer = "4243a721b9319fef96deb00e204678a4/raw/f39954407e46edca08b434754ca47c9b5a58b128/MyCareer"
        static let achivements = "2bf3e1ee16a4e751f5bbf8b7e86f303d/raw/2dded28a7edd3d01f826ecead20dcf53c253e8a6/Achivements"
    }
}
