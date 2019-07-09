//
//  AboutMeRouter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/6/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

class AboutMeRouter: AboutMeRouterProtocol{
    
    weak var viewController: UIViewController?
    static func createModule() -> UIViewController{
        // Create layers
        let router = AboutMeRouter()
        let interactor = AboutMeInteractor()
        let presenter = AboutMePresenter()
        guard let view = UIStoryboard(name: Storyboard.cvAboutMe.rawValue, bundle: nil).instantiateViewController(withIdentifier: Controller.cvAboutMe.rawValue) as? CVAboutTableViewController else { return UIViewController() }
        let navigation = UINavigationController(rootViewController: view)
        
        //Connect layers
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        navigation.isNavigationBarHidden = true
        
        return view
    }
}
