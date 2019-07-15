
import XCTest
@testable import CV_App

class BasicInformationInteractor: XCTestCase {
    
    func testFetchBasicInfoCalled() {
        guard let data = MockData().getBasicInformationData() else {
                XCTFail("Failed at getting mock info")
                return
        }
        
        let session = MockURLSession()
        session.data = data
        session.error = nil
        
        let client = Request(session: session)
        
        let sut = MainInteractor(client)
        let mockPresenter = MockMainPresenter()
        
        sut.presenter = mockPresenter
        sut.fetchUserInfo(endpoint: "https://www.dummy.com")
        
        XCTAssert(mockPresenter.userFetchedCalled > 0)
    }
    
    func testFetchGetImageCalled() {
        guard let data = MockData().getBasicInformationData() else {
            XCTFail("Failed at getting mock info")
            return
        }
        
        let session = MockURLSession()
        session.data = data
        session.error = nil
        
        let client = Request(session: session)
        
        let sut = MainInteractor(client)
        let mockPresenter = MockMainPresenter()
        
        sut.presenter = mockPresenter
        sut.fetchImage(imageURL: "https://www.dummy.com")
        
        XCTAssert(mockPresenter.downloadedImageCalled > 0)
    }
    
    func testFetchBasicInfoFailed() {
        let session = MockURLSession()
        session.data = MockData().getInvalidInformationData()
        session.error = nil
        
        let client = Request(session: session)
        
        let sut = MainInteractor(client)
        let mockPresenter = MockMainPresenter()
        
        sut.presenter = mockPresenter
        sut.fetchUserInfo(endpoint: "https://www.dummy.com")
        
        XCTAssert(mockPresenter.userFetchFailedCalled > 0)
    }
}
