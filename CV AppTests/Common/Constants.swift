import Foundation

// MARK: - Mocking url as string
enum URLString: String {
    case base = "https://api.myjson.com/bins/"
    case failBase = "https://api.myFAILjson.com/bins/"
}

// MARK: - Extensions of source files
enum ExtensionFile: String {
    case json = "json"
}

// MARK: - Assets files
enum Asset: String {
    case basicInformation = "basicInformation"
    case careerInformation = "careerInformation"
}
