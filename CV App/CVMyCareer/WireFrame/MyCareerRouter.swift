//
//  MyCareerRouter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/10/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

class MyCareerRouter: MyCareerRouterProtocol{
    
    // MARK: - Properties
    weak var viewController: UIViewController?
    
    // MARK: - Methods
    /**
     Method that sets the rootViewController. Creates the layers and connect them.
     */
    static func createModule() -> UIViewController{
        let router = MyCareerRouter()
        let interactor = MyCareerInteractor()
        let presenter = MyCareerPresenter()
        guard let view = UIStoryboard(name: Storyboard.cvMyCareer.rawValue, bundle: nil).instantiateViewController(withIdentifier: Controller.cvMyCareer.rawValue) as? MyCareerTableViewController else { return UIViewController() }
        let navigation = UINavigationController(rootViewController: view)
        
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
