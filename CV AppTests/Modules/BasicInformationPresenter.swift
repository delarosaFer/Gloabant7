
import XCTest
@testable import CV_App

class BasicInformationPresenter: XCTestCase {
    
    func testFetchBasicInfoCalled() {
        let sut = MainInteractor()
        let mockPresenter = MockMainPresenter()
        
        guard let data = MockData().getBasicInformationData(),
            let basicInformation: UserInfo = try? JSONDecoder().decode(UserInfo.self, from: data) else {
                XCTFail("Failed at getting mock info")
                return
        }
        
        sut.presenter = mockPresenter
        //        sut.fetchUserInfo(endpoint: "x")
    }
    
    func testFetchGetImageCalled() {
        let sut = MainInteractor()
        let mockPresenter = MockMainPresenter()
        
        sut.presenter = mockPresenter
        sut.fetchImage(imageURL: "https://image.png")
        
        XCTAssert(mockPresenter.downloadedImageCalled > 0)
    }
    
    
}
