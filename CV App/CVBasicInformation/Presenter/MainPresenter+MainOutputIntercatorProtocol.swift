
import Foundation

//MARK: - Extension for MainOutputIntercator
extension MainPresenter: MainOutputIntercatorProtocol {
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
