
import UIKit

final class MyCareerPresenter: MyCareerPresenterProtocol {
    // MARK: - Properties
    weak var view: MyCareerViewControllerProtocol?
    var interactor: MyCareerInputIntercatorProtocol?
    var router: MyCareerRouterProtocol?
    var myCareer: MyCareer?

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
