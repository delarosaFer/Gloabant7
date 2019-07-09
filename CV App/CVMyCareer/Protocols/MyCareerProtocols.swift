//
//  MyCareerProtocols.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/10/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol MyCareerViewControllerProtocol: class{
    //Presenter -> View
    func showMyCareer (with myCareer:  MyCareerResult)
    func showNetworkingError()
}

protocol MyCareerPresenterProtocol{
    //View -> Presenter
    var view: MyCareerViewControllerProtocol? { get set }
    var interactor: MyCareerInputIntercatorProtocol? { get set }
    var router: MyCareerRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol MyCareerInputIntercatorProtocol{
    //Presenter -> Interactor
    var presenter: MyCareerOutputIntercatorProtocol? { get set }
    func fetchMyCareer (endpoint: String)
    
}

protocol MyCareerOutputIntercatorProtocol{
    //Interactor -> Presenter
    func myCareerFeteched(myCareer: MyCareerResult)
    func userFetchFailed()
}

protocol MyCareerRouterProtocol{
    //Presenter -> Router
    static func createModule() -> UIViewController
}
