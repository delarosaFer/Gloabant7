
import UIKit

/**
 Presenter -> View Protocol.
 */
protocol MainViewControllerProtocol: class{
    func showUserInfo (with user: UserInfo)
    func showNetworkingError()
    func imageWithData(data: Data)
}

/**
 View -> Presenter Protocol.
 */
protocol MainPresenterProtocol{
    var view: MainViewControllerProtocol? { get set }
    var interactor: MainInputInteractorProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    
    func updateView()
    func myCareerPressed()
    func getImage(imageURL: String)
}

/**
 Presenter -> Interactor Protocol.
 */
protocol MainInputInteractorProtocol{
    var presenter: MainOutputIntercatorProtocol? { get set }
    func fetchUserInfo (endpoint: String)
    func fetchImage(imageURL: String)
}

/**
 Interactor -> Presenter Protocol.
 */
protocol MainOutputIntercatorProtocol{
    func userFeteched(user: UserInfo)
    func userFetchFailed()
    func dowloadedImage(_ data: Data)
}

/**
 Presenter -> Router Protocol.
 */
protocol MainRouterProtocol{
    func pushMyCareer()
    static func createModule() -> UINavigationController
}
