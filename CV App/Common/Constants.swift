//
//  Constants.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation

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
    }
}

//MARK: - Endpoint URLs
enum EndPoint: String {
    case userInfo = "120xcf"
    case myCareer = "e5unb"
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
    //MARK: - Alert controller comments
    case titleError = "Title error!"
    case messageError = "Message error!"
    
    //MARK: - Viewcontroller comments
    case aboutMe = "About me view"
    case myCareer = "My Career view"
    case achivements = "Achivements view"
    
    //MARK: - Labels UserInfoView comments
    case labelAge = "Label Age"
    case labelPhone = "Label Phone"
    case labelEmail = "Label Email"
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
