//
//  MainInteractor.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation

class MainInteractor: MainInputIntercatorProtocol{
    //MARK: - Properties
    var presenter: MainOutputIntercatorProtocol?
    
    // MARK: - Methods
    
    //Method for create and fetch the request
    func fetchUserInfo(endpoint: String) {
        Request.shared.request(endpoint, entity: UserInfo.self ) { [weak self] fetchResult in
            switch fetchResult{
            case .success(let data):
                let userFetch: UserInfo? = Request.shared.jsonDecode(data: data)
                guard  let user = userFetch, let _ = self?.presenter?.userFeteched(user: user) else{
                    self?.presenter?.userFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.userFetchFailed()
            }
        }
    }
    
    func fetchImage(imageURL: String){
        Request.shared.downloadImage(urlImage: imageURL) { [weak self] fetchingImage in
            switch fetchingImage{
            case .success(let data):
                self?.presenter?.dowloadedImage(data)
            case .failure(_):
                break
            }
            
        }
    }
}
