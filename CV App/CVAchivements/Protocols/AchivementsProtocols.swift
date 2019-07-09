//
//  AchivementsProtocols.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/11/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol AchivementsViewControllerProtocol: class{
    //Presenter -> View
    func showAchivements (with achivements: AchivementsResult)
    func showNetworkingError()
}

protocol AchivementsPresenterProtocol{
    //View -> Presenter
    var view: AchivementsViewControllerProtocol? { get set }
    var interactor: AchivementsInputIntercatorProtocol? { get set }
    var router: AchivementsRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol AchivementsInputIntercatorProtocol{
    //Presenter -> Interactor
    var presenter: AchivementsOutputIntercatorProtocol? { get set }
    func fetchAchivements (endpoint: String)
}

protocol AchivementsOutputIntercatorProtocol{
    //Interactor -> Presenter
    func achivementsFeteched(achivements: AchivementsResult)
    func userFetchFailed()
}

protocol AchivementsRouterProtocol{
    //Presenter -> Router
    static func createModule() -> UIViewController
}
