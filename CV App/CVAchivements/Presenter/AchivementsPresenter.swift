//
//  AchivementsPresenter.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/11/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation

class AchivementsPresenter: AchivementsPresenterProtocol{
    weak var view: AchivementsViewControllerProtocol?
    var interactor: AchivementsInputIntercatorProtocol?
    var router: AchivementsRouterProtocol?
    var achivements: AchivementsResult?
    
    func viewDidLoad() {
        self.updateView()
    }
    
    func updateView() {
        interactor?.fetchAchivements(endpoint: Constants.Endpoints.achivements)
    }
}

extension AchivementsPresenter: AchivementsOutputIntercatorProtocol{
    func achivementsFeteched(achivements: AchivementsResult) {
        view?.showAchivements(with: achivements)
    }
    
    func userFetchFailed() {
        view?.showNetworkingError()
    }
}
