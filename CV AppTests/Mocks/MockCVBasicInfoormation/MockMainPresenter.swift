import Foundation
@testable import CV_App

final class MockMainPresenter: MainPresenterProtocol {
    
    var view: MainViewControllerProtocol?
    var interactor: MainInputInteractorProtocol?
    var router: MainRouterProtocol?
    var updateViewCalled = 0
    var myCareerPressedCalled = 0
    var getImageCalled = 0
    
    func updateView() {
        updateViewCalled += 1
    }
    
    func myCareerPressed() {
        myCareerPressedCalled += 1
    }
    
    func getImage(imageURL: String) {
    getImageCalled += 1
    }
    
}
