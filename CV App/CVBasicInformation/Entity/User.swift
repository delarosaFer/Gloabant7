//
//  User.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation

//MARK: - UserInfo
struct UserInfo: Codable {
    let userName: String
    let age: String
    let cellphone: String
    let email: String
    let imageURL: String?
    let skills: String
}
