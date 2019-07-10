//
//  MyCareerPresenter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/10/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class MyCareerPresenter: MyCareerPresenterProtocol{
    
    // MARK: - Properties
    weak var view: MyCareerViewControllerProtocol?
    var interactor: MyCareerInputIntercatorProtocol?
    var router: MyCareerRouterProtocol?
    var myCareer: MyCareer?
    
    // MARK: - Methods
    func viewDidLoad() {
        self.updateView()
    }
    
    func updateView() {
        interactor?.fetchMyCareer(endpoint: EndPoint.myCareer.rawValue)
    }
}

// MARK: - Extension for MyCareerOutputIntercator
extension MyCareerPresenter: MyCareerOutputIntercatorProtocol{
    func myCareerFeteched(myCareer: MyCareer) {
        view?.showMyCareer(with: myCareer)
    }
    
    func userFetchFailed() {
        view?.showNetworkingError()
    }
}
