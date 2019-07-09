//
//  AchivementsRouter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/11/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation

import UIKit

class AchivementsRouter: AchivementsRouterProtocol{
    
    //MARK: - Properties
    weak var viewController: UIViewController?

    //MARK: - Methods
    static func createModule() -> UIViewController{
        // Create layers
        let router = AchivementsRouter()
        let interactor = AchivementsInteractor()
        let presenter = AchivementsPresenter()
        guard let view = UIStoryboard(name: Storyboard.cvAchivements.rawValue, bundle: nil).instantiateViewController(withIdentifier: Controller.cvMyAchivements.rawValue) as? AchivementsTableViewController else { return UIViewController() }
        
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
