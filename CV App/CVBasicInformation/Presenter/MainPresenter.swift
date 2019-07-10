//
//  MainPresenter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter: MainPresenterProtocol {
    
    // MARK: - Properties
    var view: MainViewControllerProtocol?
    var interactor: MainInputInteractorProtocol?
    var router: MainRouterProtocol?
    
    // MARK: - Methods
    func viewDidLoad() {
        self.updateView()
    }
    
    func updateView() {
        interactor?.fetchUserInfo(endpoint: EndPoint.userInfo.rawValue)
    }
    
    func getImage(imageURL: String){
        interactor?.fetchImage(imageURL: imageURL)
    }
    
    func myCareerPressed() {
        router?.pushMyCareer()
    }  
}

// MARK: - Extension for MainOutputIntercator
extension MainPresenter: MainOutputIntercatorProtocol{
    func userFeteched(user: UserInfo) {
        view?.showUserInfo(with: user)
    }
    
    func userFetchFailed() {
        view?.showNetworkingError()
    }
    
    func dowloadedImage(_ data: Data){
        view?.imageWithData(data: data)
    }
}
