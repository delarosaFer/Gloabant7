import Foundation

// MARK: - AboutMe
struct AboutMe: Codable {
    let about, hobbies: About
    let skills: Skills
    let sections: Int
}

// MARK: - About
struct About: Codable {
    let titleSection, text: String
    let rowsInSection: Int
}

// MARK: - Skills
struct Skills: Codable {
    let titleSection, resume: String
    let rowsInSection: Int
}
