
import Foundation
@testable import CV_App

class MockData {
    func getBasicInformationData() -> Data? {
        let bundle = Bundle(for: type(of: self))
        
        guard let path = bundle.path(forResource: "basicInformation", ofType: "json") else {
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        
        return data
    }
    
    func getInvalidInformationData() -> Data? {
        let bundle = Bundle(for: type(of: self))
        
        guard let path = bundle.path(forResource: "failBasicInformation", ofType: "json") else {
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        
        return data
    }
}
