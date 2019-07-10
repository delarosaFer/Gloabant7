
import UIKit

// MARK: - Protocols
/**
 Presenter -> View Protocol.
 */
protocol MyCareerViewControllerProtocol: class{
    func showMyCareer (with myCareer:  MyCareer)
    func showNetworkingError()
}

/**
 View -> Presenter Protocol.
 */
protocol MyCareerPresenterProtocol{
    var view: MyCareerViewControllerProtocol? { get set }
    var interactor: MyCareerInputIntercatorProtocol? { get set }
    var router: MyCareerRouterProtocol? { get set }
    
    func updateView()
}

/**
 Presenter -> Interactor Protocol.
 */
protocol MyCareerInputIntercatorProtocol{
    var presenter: MyCareerOutputIntercatorProtocol? { get set }
    func fetchMyCareer (endpoint: String)
    
}

/**
 Interactor -> Presenter Protocol.
 */
protocol MyCareerOutputIntercatorProtocol{
    func myCareerFeteched(myCareer: MyCareer)
    func userFetchFailed()
}

/**
 Presenter -> Router Protocol.
 */
protocol MyCareerRouterProtocol{
    static func createModule() -> UIViewController
}
