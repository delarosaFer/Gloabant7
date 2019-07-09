//
//  AboutMeTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//
import XCTest
@testable import CV_App

class AboutMeTests: XCTestCase{
    
    func testUsrInfoSetGet(){
       let aboutMe = AboutMeResult(response: Response(AboutMe: AboutMe(about: About(titleSection: "About Title", text: "text", rowsInSection: 2), hobbies: About(titleSection: "Hobbies Title", text: "text", rowsInSection: 1), Skills: Skills(titleSection: "Skills title", resume: "resume", rowsInSection: 3), sections: 3)))
        XCTAssertEqual(aboutMe.response.AboutMe.about.titleSection, "About Title")
        XCTAssertEqual(aboutMe.response.AboutMe.about.text, "text")
        XCTAssertEqual(aboutMe.response.AboutMe.about.rowsInSection, 2)
        XCTAssertEqual(aboutMe.response.AboutMe.hobbies.titleSection, "Hobbies Title")
        XCTAssertEqual(aboutMe.response.AboutMe.hobbies.text, "text")
        XCTAssertEqual(aboutMe.response.AboutMe.hobbies.rowsInSection, 1)
        XCTAssertEqual(aboutMe.response.AboutMe.Skills.titleSection, "Skills title")
        XCTAssertEqual(aboutMe.response.AboutMe.Skills.resume, "resume")
        XCTAssertEqual(aboutMe.response.AboutMe.Skills.rowsInSection, 3)
        XCTAssertEqual(aboutMe.response.AboutMe.sections, 3)
    }
}
