import XCTest
@testable import CV_App

class NetworkLayer: XCTestCase, CommonMethods {

    func testRequest() {
        let client: Request
        let baseStr = URLString.base.rawValue
        let endPoint = EndPoint.userInfo.rawValue
        guard let baseURL = URL(string: baseStr) else {
            XCTFail("Couldn't create an URL")
            return
        }
        
        let sessionURL = MockURLSession()
        sessionURL.data = getDataFrom(file: Asset.basicInformation.rawValue)
        sessionURL.response = HTTPURLResponse(url: baseURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "Test a request with a valid url base, and valid URLSession")
        client = Request(baseURL: baseStr, session: sessionURL)
        
        client.request(endPoint, entity: UserInfo.self) { fetchResult in
            switch fetchResult {
            case .success(data: _):
                expectation.fulfill()
            case .failure( _):
                XCTFail("The data could not be loaded")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testInvalidURLBaseRequest() {
        let client: Request
        let baseStr = URLString.failBase.rawValue
        let endPoint = EndPoint.userInfo.rawValue
        guard let baseURL = URL(string: baseStr) else {
            XCTFail("Couldn't create an URL")
            return
        }
        
        let sessionURL = MockURLSession()
        sessionURL.data = nil
        sessionURL.response = HTTPURLResponse(url: baseURL, statusCode: 400, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "Test a request with an invalid url base, and valid URLSession")
        client = Request(baseURL: baseStr, session: sessionURL)
        
        client.request(endPoint, entity: UserInfo.self) { fetchResult in
            switch fetchResult {
            case .success(data: _):
                XCTFail("This data must be nill")
            case .failure( _):
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testNOInternetConnection() {
        let client: Request
        let baseStr = URLString.base.rawValue
        guard let baseURL = URL(string: baseStr) else {
            XCTFail("Couldn't create an URL")
            return
        }
        
        let session = MockURLSession()
        session.response = HTTPURLResponse(url: baseURL, statusCode: 0, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "Test request with a valid url base, and a URLSession whit 0 at code response")
        client = Request(baseURL: baseStr, session: session)
        
        client.request(EndPoint.userInfo.rawValue, entity: UserInfo.self) { (fetchResult) in
            switch fetchResult {
            case .success(data: _):
                XCTFail("The data must be nill")
            case .failure( _):
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testEndPointCareerInformationRequest() {
        let client: Request
        let baseStr = URLString.base.rawValue
        let endPoint = EndPoint.myCareer.rawValue
        guard let baseURL = URL(string: baseStr) else {
            XCTFail("Couldn't create an URL")
            return
        }
        
        let sessionURL = MockURLSession()
        sessionURL.data = getDataFrom(file: Asset.careerInformation.rawValue)
        sessionURL.response = HTTPURLResponse(url: baseURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "Test a request with a valid url base, and valid URLSession")
        client = Request(baseURL: baseStr, session: sessionURL)
        
        client.request(endPoint, entity: MyCareer.self) { fetchResult in
            switch fetchResult {
            case .success(data: _):
                expectation.fulfill()
            case .failure( _):
                XCTFail("The data could not be loaded")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testInvalidEndPointCareerInformationRequest() {
        let client: Request
        let baseStr = URLString.failBase.rawValue
        let endPoint = EndPoint.userInfo.rawValue
        guard let baseURL = URL(string: baseStr) else {
            XCTFail("Couldn't create an URL")
            return
        }
        
        let sessionURL = MockURLSession()
        sessionURL.data = nil
        sessionURL.response = HTTPURLResponse(url: baseURL, statusCode: 400, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: "Test a request with an invalid url base, and valid URLSession")
        client = Request(baseURL: baseStr, session: sessionURL)
        
        client.request(endPoint, entity: MyCareer.self) { fetchResult in
            switch fetchResult {
            case .success(data: _):
                XCTFail("This data must be nill")
            case .failure( _):
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
