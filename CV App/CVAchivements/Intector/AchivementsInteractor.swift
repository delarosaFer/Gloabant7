//
//  AchivementsInteractor.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/11/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation


class AchivementsInteractor: AchivementsInputIntercatorProtocol{
    
    //MARK: - Properties
    var presenter: AchivementsOutputIntercatorProtocol?
    var positionTable = [[String : AnyObject]]()
    
    //MARK: - Methods
    //Method for create and fetch the request
    func fetchAchivements(endpoint: String) {
        Request.shared.request(endpoint, entity: AchivementsResult.self) { [weak self] fetchResult in
            switch fetchResult{
            case .success(let data):
                let achivementsFetch: AchivementsResult? = Request.shared.jsonDecode(data: data)
                guard let _ = self?.presenter?.achivementsFeteched(achivements: achivementsFetch!) else{
                    self?.presenter?.userFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.userFetchFailed()
            }
        }
    }
}
