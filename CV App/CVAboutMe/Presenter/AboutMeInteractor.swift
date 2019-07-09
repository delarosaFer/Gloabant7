//
//  AboutMeInteractor.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/7/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation

class AboutMeInteractor: AboutMeInputIntercatorProtocol{
    
    var presenter: AboutMeOutputIntercatorProtocol?
    var positionTable = [[String : AnyObject]]()
    //Method for create and fetch the request
    func fetchAboutMe(endpoint: String) {
        Request.shared.request(endpoint, entity: AboutMe.self) { [weak self] fetchResult in
            
            switch fetchResult{
            case .success(let data):
                let aboutMeFetch: AboutMe? = Request.shared.jsonDecode(data: data)
                guard let _ = self?.presenter?.aboutMeFeteched(aboutMe: aboutMeFetch!) else{
                    self?.presenter?.aboutMeFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.aboutMeFetchFailed()
            }
        }
    }
}
