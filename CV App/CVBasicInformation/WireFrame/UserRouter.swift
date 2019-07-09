//
//  UserRouter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

class UserRouter: MainRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UINavigationController {
        // Create layers
        let router = UserRouter()
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        
        let view = UIStoryboard(name: "UserInfo", bundle: nil).instantiateViewController(withIdentifier: Constants.StoryboardNames.cvInformation) as! UserInfoViewController
        
        let navigation = UINavigationController(rootViewController: view)
        
        //Connect layers
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        navigation.isNavigationBarHidden = false
        return navigation
    }
    //Method for present the About Me section
    func pushAboutMe() {
        let aboutMeViewcontroller = AboutMeRouter.createModule()
        
        viewController?.navigationController?.pushViewController(aboutMeViewcontroller, animated: true)
    }
    //Method for present the My career section
    func pushMyCareer() {
        let myCareerViewController = MyCareerRouter.createModule()
        viewController?.navigationController?.pushViewController(myCareerViewController, animated: true)
    }
    //Method for present the Achivements section
    func pushAchivements() {
        let achivementsViewController = AchivementsRouter.createModule()
        viewController?.navigationController?.pushViewController(achivementsViewController, animated: true)
    }
}
