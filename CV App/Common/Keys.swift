import Foundation

//MARK: - Keys to get a URL from xcconfig
enum URLKey: String {
    case request = "URLRequest"
}

//MARK: - Animation keys
enum AnimationKey: String {
    case transform = "transform.scale"
    case scale = "scale"
    case opacity = "opacity"
}

//MARK: - Keys for localizable strings
enum StringKey: String {
    //MARK: - Alert controller strings
    case titleError = "titleError!"
    case messageError = "messageError"
    
    //MARK: - Title view strings
    case aboutMe = "aboutMe"
    case myCareer = "myCareer"
    case achivements = "achivements"
}
