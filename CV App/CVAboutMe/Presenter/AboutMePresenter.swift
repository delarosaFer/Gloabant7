//
//  AboutMePresenter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/6/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class AboutMePresenter: AboutMePresenterProtocol{
    
    //MARK: - Properties
    weak var view: AboutMeViewControllerProtocol?
    var interactor: AboutMeInputIntercatorProtocol?
    var router: AboutMeRouterProtocol?
    var aboutMe: AboutMe?
    
    //MARK: - Methods
    func viewDidLoad() {
        self.updateView()
    }
    
    func updateView() {
        interactor?.fetchAboutMe(endpoint: EndPoint.aboutMe.rawValue)
    }
    
}
//MARK: - Extension for AboutMeOutputIntercator
extension AboutMePresenter: AboutMeOutputIntercatorProtocol{
    func aboutMeFeteched(aboutMe: AboutMe) {
        view?.showAboutMe(with: aboutMe)
    }
    
    func aboutMeFetchFailed() {
        view?.showNetworkingError()
    }
}
