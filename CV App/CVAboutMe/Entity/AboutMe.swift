import Foundation

// MARK: - AboutMeResult
struct AboutMeResult: Codable {
    let response: Response
    
    init(response: Response) {
        self.response = response
    }
}

// MARK: - Response
struct Response: Codable {
    let AboutMe: AboutMe
    
    init(AboutMe: AboutMe) {
        self.AboutMe = AboutMe
    }
}

// MARK: - AboutMe
struct AboutMe: Codable {
    let about, hobbies: About
    let Skills: Skills
    let sections: Int
    
    init(about: About, hobbies: About, Skills: Skills, sections: Int) {
        self.about = about
        self.hobbies = hobbies
        self.Skills = Skills
        self.sections = sections
    }
}

// MARK: - About
struct About: Codable {
    let titleSection, text: String
    let rowsInSection: Int
    
    init(titleSection: String, text: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.text = text
        self.rowsInSection = rowsInSection
    }
}

// MARK: - Skills
struct Skills: Codable {
    let titleSection, resume: String
    let rowsInSection: Int
    
    init(titleSection: String, resume: String, rowsInSection: Int) {
        self.titleSection = titleSection
        self.resume = resume
        self.rowsInSection = rowsInSection
    }
}
