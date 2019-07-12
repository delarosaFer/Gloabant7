import Foundation

class MainInteractor: MainInputInteractorProtocol{
    // MARK: - Properties

    var presenter: MainOutputIntercatorProtocol?
    
    // MARK: - Methods
    /**
    Method for create and fetch the request.
     
     - Parameters:
     - endpoint: endpoint to request.
     */
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
    
    /**
     Method for create and fetch the image.
     
     - Parameters:
     - imageURL: imageURL to fetch.
     */
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
