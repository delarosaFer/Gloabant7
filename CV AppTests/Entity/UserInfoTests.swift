//
//  UserInfoTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import XCTest
@testable import CV_App

class UserInfoTests: XCTestCase{
    
    func testUsrInfoSetGet(){
        let user = UserResult(response: UserResponse(userInfo: UserInfo(userName: "Test", age: "22", cellphone: "0000000", email: "test@globant.com", imageURL: "test.com", linkedInURL: "test.com")))
        XCTAssertEqual(user.response.userInfo.age, "22")
        XCTAssertEqual(user.response.userInfo.cellphone, "0000000")
        XCTAssertEqual(user.response.userInfo.imageURL, "test.com")
        XCTAssertEqual(user.response.userInfo.userName, "Test")
        XCTAssertEqual(user.response.userInfo.email, "test@globant.com")
        XCTAssertEqual(user.response.userInfo.linkedInURL, "test.com")
    }
}
