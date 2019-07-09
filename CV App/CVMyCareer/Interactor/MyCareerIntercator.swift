//
//  MyCareerIntercator.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/10/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//
import Foundation

class MyCareerInteractor: MyCareerInputIntercatorProtocol{

    //MARK: - Properties
    var presenter: MyCareerOutputIntercatorProtocol?
    var positionTable = [[String : AnyObject]]()
    
    //MARK: - Methods
    func fetchMyCareer(endpoint: String) {
        Request.shared.request(endpoint, entity: MyCareer.self) { [weak self] fetchResult in
            
            switch fetchResult{
            case .success(let data):
                let myCareerFetch: MyCareer? = Request.shared.jsonDecode(data: data)
                guard let _ = self?.presenter?.myCareerFeteched(myCareer: myCareerFetch!) else{
                    self?.presenter?.userFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.userFetchFailed()
            }
        }
    }
}
