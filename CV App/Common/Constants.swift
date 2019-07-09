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

//MARK: - Storyboard name
enum Storyboard: String {
    case userInfo = "UserInfo"
    case cvAboutMe = "CVAboutMe"
    case cvMyCareer = "CVMyCareer"
    case cvAchivements = "CVAchivements"
}

//MARK: - Controller name
enum Controller: String {
    case cvInformation = "UserInfoViewController"
    case cvAboutMe = "CVAboutTableViewController"
    case cvMyCareer = "MyCareerTableViewController"
    case cvMyAchivements = "AchivementsTableViewController"
    case alert = "AlertView"
}

//MARK: - Get URL base from xcconfig
enum Configuration {
    static func getUrl(for key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)
>>>>>>> fix: statics strings, magic numbers, localizable, xcconfig, print, force unwarps, outlets optionals, just iphone device --> Todo: static strings and numbers in testing
    }
}

//MARK: - Endpoint URLs
enum EndPoint: String {
    case userInfo = "120xcf"
    case aboutMe = "b290f1f79adcbee0d716410e5862fa12/raw/f73751f9ab119f927317d0eaf8032884b40668b5/AboutMe"
    case myCareer = "e5unb"
    case achivements = "2bf3e1ee16a4e751f5bbf8b7e86f303d/raw/2dded28a7edd3d01f826ecead20dcf53c253e8a6/Achivements"
}

//MARK: - Default values
enum Default: String {
    case empty = ""
}

//MARK: - HTTP Methods
enum HTTP: String {
    case get = "GET"
}

//MARK: - Cell identifier
enum Cell: String {
    case cell = "UITableViewCell"
}

//MARK: - Comments
enum Comment: String {
    case titleError = "Title error!"
    case messageError = "Message error!"
    case aboutMe = "About me view"
    case myCareer = "My Career view"
    case achivements = "Achivements view"
}

//MARK: - Values number type
enum NumberF: Float {
    case zero = 0.0
    case half = 2.0
    case duration = 6.6
    case toValue = 1.4
}

enum NumberI: Int {
    case empty = 0
}
