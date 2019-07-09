//
//  MainProtocol.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 5/31/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol AboutMeViewControllerProtocol: class{
    //Presenter -> View
    func showAboutMe (with aboutMe:  AboutMe)
    func showNetworkingError()
}

protocol AboutMePresenterProtocol{
    //View -> Presenter
    var view: AboutMeViewControllerProtocol? { get set }
    var interactor: AboutMeInputIntercatorProtocol? { get set }
    var router: AboutMeRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol AboutMeInputIntercatorProtocol{
    //Presenter -> Interactor
    var presenter: AboutMeOutputIntercatorProtocol? { get set }
    func fetchAboutMe(endpoint: String)
    
}

protocol AboutMeOutputIntercatorProtocol{
    //Interactor -> Presenter
    func aboutMeFeteched(aboutMe: AboutMe)
    func aboutMeFetchFailed()
}

protocol AboutMeRouterProtocol{
    //Presenter -> Router
    static func createModule() -> UIViewController
}
