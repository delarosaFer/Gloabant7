import XCTest
@testable import CV_App


class UserInformationView: XCTestCase {
    
    var userInformationViewController: UserInfoViewController?

    override func setUp() {
        let storyboard = UIStoryboard.init(name: Storyboard.userInfo.rawValue, bundle: Bundle.main)
        userInformationViewController = storyboard.instantiateViewController(withIdentifier: Controller.cvInformation.rawValue) as? UserInfoViewController
    }

    override func tearDown() {
        userInformationViewController = nil
        super.tearDown()
    }
    
    func testElements() {
        userInformationViewController?.loadViewIfNeeded()
        
        XCTAssertNotNil(userInformationViewController?.userNameLabel)
        XCTAssertNotNil(userInformationViewController?.ageLabel)
        XCTAssertNotNil(userInformationViewController?.emailLabel)
        XCTAssertNotNil(userInformationViewController?.cellphoneLabel)
        XCTAssertNotNil(userInformationViewController?.profileUserImage)
        XCTAssertNotNil(userInformationViewController?.aboutMeLabel)
        XCTAssertNotNil(userInformationViewController?.configureMoreInfoButton(CircleButtonFactory.createCircleButton()))
    }
    
    func testViewDisplayCorrectInformation() {
        guard let userData = MockData().getBasicInformationData() else {
            XCTFail("User information data could not be loaded")
            return
        }
        guard let model = MockData().getUserInformation(data: userData) else {
            XCTFail("User model could not be created")
            return
        }
        userInformationViewController?.loadViewIfNeeded()
        userInformationViewController?.showUserInfo(with: model)
        guard let user = userInformationViewController?.user else {
            XCTFail("View could not displayed the information")
            return
        }
        XCTAssertEqual(user.userName, "Jordy Xavier Pazaran Reyes")
        XCTAssertEqual(user.age, 22)
        XCTAssertEqual(user.cellphone, "(044)5565014640")
        XCTAssertEqual(user.email, "jordy.pazaran@globant.com")
        XCTAssertEqual(user.skills, "I'm consider that I have alot of Softskills, and y work very well in a team, I like to have constant communication with my coworkers. I been working on Swift since 2 and half years and I know how to work with Cocoapods and MVC, VIPER and Flow Coordinator patterns design.")
    }
}
