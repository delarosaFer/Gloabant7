//
//  User.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation

//MARK: - UserResult
struct UserResult: Codable{
    let response: UserResponse
    
    init(response: UserResponse) {
        self.response = response
    }
}
//MARK: - UserResponse
struct UserResponse: Codable{
    let userInfo: UserInfo
    
    init(userInfo: UserInfo) {
        self.userInfo = userInfo
    }
}
//MARK: - UserInfo
struct UserInfo: Codable {
    let userName: String?
    let age: String?
    let cellphone: String?
    let email: String?
    let imageURL: String?
    let linkedInURL: String?
    
    init(userName: String, age: String, cellphone: String, email: String, imageURL: String, linkedInURL: String) {
        self.userName = userName
        self.age = age
        self.cellphone = cellphone
        self.email = email
        self.imageURL = imageURL
        self.linkedInURL = linkedInURL
    }
}
