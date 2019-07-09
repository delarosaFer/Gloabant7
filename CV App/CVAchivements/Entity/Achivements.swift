//
//  Achivements.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/11/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import Foundation

// MARK: - Welcome
struct AchivementsResult: Codable {
    let achivementsResponse: AchivementsResponse
    
    init(achivementsResponse: AchivementsResponse) {
        self.achivementsResponse = achivementsResponse
    }
}

// MARK: - AchivementsResponse
struct AchivementsResponse: Codable {
    let Achivements: Achivements
 
    init(achivements: Achivements) {
        self.Achivements = achivements
    }
}

// MARK: - Achivements
struct Achivements: Codable {
    let Courses: Courses
    let Talks: Talks
    let Extras: Extras
    let sections: Int
    
    init(Courses: Courses, Talks: Talks, Extras: Extras, sections: Int) {
        self.Courses = Courses
        self.Talks = Talks
        self.Extras = Extras
        self.sections = sections
    }
}

// MARK: - Courses
struct Courses: Codable {
    let titleSection, CiscoCCNA: String
    let rowsInSection: Int
    
    init(titleSection: String, CiscoCCNA: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.CiscoCCNA = CiscoCCNA
        self.rowsInSection = rowsInSection
    }
}

// MARK: - Extras
struct Extras: Codable {
    let titleSection, resume: String
    let rowsInSection: Int
    
    init(titleSection: String, resume: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.resume = resume
        self.rowsInSection = rowsInSection
    }
}

// MARK: - Talks
struct Talks: Codable {
    let titleSection, talk1, talk2: String
    let rowsInSection: Int
    
    init(titleSection: String, talk1: String, talk2: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.talk1 = talk1
        self.talk2 = talk2
        self.rowsInSection = rowsInSection
    }
}
