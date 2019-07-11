import Foundation
@testable import CV_App

final class MockMyCareerInteractor: MyCareerInputIntercatorProtocol {
    
    var presenter: MyCareerOutputIntercatorProtocol?
    var fetchMyCareerCalled = 0
    
    func fetchMyCareer(endpoint: String) {
        fetchMyCareerCalled += 1
    }
}
