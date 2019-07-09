//
//  UserInfoViewTests.swift
//  CV AppTests
//
//  Created by Jordy Xavier Pazaran Reyes on 6/16/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import XCTest
@testable import CV_App

class UserInfoViewTest: XCTestCase{
    
    var view: UserInfoViewController?
    var mockMainView: MockMainView?
    
    override func setUp() {
        
        let storyboard = UIStoryboard(name: Storyboard.userInfo.rawValue, bundle: nil)
        mockMainView = MockMainView()
        view = storyboard.instantiateViewController(withIdentifier: Controller.cvInformation.rawValue) as? UserInfoViewController
        
        self.view?.loadView()
        self.view?.viewDidLoad()
        
        var _: UILabel? = UILabel()
        var _: UILabel? = UILabel()
        var _: UILabel? = UILabel()
        var _: UILabel? = UILabel()
        var _: UIImageView?
        var _: UIView?
        var _: UIButton?
        var _: UIButton?
        var _: UIButton?
        var _: UIButton?
        
    }
    
    func testShowUserInfoShowCorrectData(){
        let failTest = NSLocalizedString("Theres was an error showing user info data", comment: "")
        let expectationText = NSLocalizedString("Request success", comment: "")
        let expectation = XCTestExpectation(description: expectationText)
 
        let data1 = UserResult(response: UserResponse(userInfo: UserInfo(userName: "Test", age: "22", cellphone: "0000000", email: "test@globant.com", imageURL: "test.com", linkedInURL: "test.com")))
        
        guard (view?.showUserInfo(with: data1)) != nil else {
            XCTFail(failTest)
            return
        }
      expectation.fulfill()
    }
    
    func testGenericAlertDisplaySuccess(){
       let _ = AlertView.instance.showAlert(title: "Error", message: "There was an error loading the information")
        
    }
}
