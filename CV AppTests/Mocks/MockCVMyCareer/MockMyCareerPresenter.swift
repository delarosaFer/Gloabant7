import Foundation
@testable import CV_App

final class MockMyCareerPresenter: MyCareerPresenterProtocol {
    
    var view: MyCareerViewControllerProtocol?
    var interactor: MyCareerInputIntercatorProtocol?
    var router: MyCareerRouterProtocol?
    var updateViewCalled = 0
    
    func updateView() {
        updateViewCalled += 1
    }
    
    
}
