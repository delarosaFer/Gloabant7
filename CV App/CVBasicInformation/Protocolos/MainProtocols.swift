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
protocol MainViewControllerProtocol: class{
    //Presenter -> View
    func showUserInfo (with user: UserResult)
    func showNetworkingError()
    func createPulse()
    func animatePulse(index: Int)
    func imageWithData(data: Data)
}

protocol MainPresenterProtocol{
    //View -> Presenter
    var view: MainViewControllerProtocol? { get set }
    var interactor: MainInputIntercatorProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    
    func viewDidLoad()
    func aboutMePressed()
    func myCareerPressed()
    func achivementsPressed()
    func getImage(imageURL: String)
}

protocol MainInputIntercatorProtocol{
    //Presenter -> Interactor
    var presenter: MainOutputIntercatorProtocol? { get set }
    func fetchUserInfo (endpoint: String)
    func fetchImage(imageURL: String)
    
}

protocol MainOutputIntercatorProtocol{
    //Interactor -> Presenter
    func userFeteched(user: UserResult)
    func userFetchFailed()
    func dowloadedImage(_ data: Data)
}

protocol MainRouterProtocol{
    //Presenter -> Router
    func pushAboutMe()
    func pushMyCareer()
    func pushAchivements()
    static func createModule() -> UINavigationController
}
