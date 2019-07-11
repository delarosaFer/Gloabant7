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
        let user = UserInfo(userName: "Test", age: 22, cellphone: "0000000", email: "test@globant.com", imageURL: "test.com", skills: "test.com")
        XCTAssertEqual(user.age, 22)
        XCTAssertEqual(user.cellphone, "0000000")
        XCTAssertEqual(user.imageURL, "test.com")
        XCTAssertEqual(user.userName, "Test")
        XCTAssertEqual(user.email, "test@globant.com")
        XCTAssertEqual(user.skills, "test.com")
    }
}
