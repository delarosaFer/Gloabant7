import XCTest
@testable import CV_App

class CareerInformationView: XCTestCase, CommonMethods {
    
    var careerInformationViewController: MyCareerTableViewController?
    
    override func setUp() {
        let storyboard = UIStoryboard.init(name: Storyboard.cvMyCareer.rawValue, bundle: Bundle.main)
        careerInformationViewController = storyboard.instantiateViewController(withIdentifier: Controller.cvMyCareer.rawValue) as? MyCareerTableViewController
    }

    override func tearDown() {
        careerInformationViewController = nil
        super.tearDown()
    }
    
    func testElements() {
        careerInformationViewController?.loadViewIfNeeded()
        
        XCTAssertNotNil(careerInformationViewController?.tableView)
    }
    
    func testCareerTableViewDisplayCorrectNumberOfSections() {
        let careerData = getDataFrom(file: Asset.careerInformation.rawValue)
        guard let model = MockData().getCareerInformation(data: careerData) else {
            XCTFail(Fail.loadData.rawValue)
            return
        }
        careerInformationViewController?.loadViewIfNeeded()
        careerInformationViewController?.showMyCareer(with: model)
        guard let tableView = careerInformationViewController?.tableView else {
            XCTFail(Fail.careerNotTableView.rawValue)
            return
        }
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 3)
    }
    
    
    func testTableViewDisplayCorrectNumberOfRows() {
        let careerData = getDataFrom(file: Asset.careerInformation.rawValue)
        guard let model = MockData().getCareerInformation(data: careerData) else {
            XCTFail(Fail.loadData.rawValue)
            return
        }
        
        careerInformationViewController?.loadViewIfNeeded()
        careerInformationViewController?.showMyCareer(with: model)
        
        guard let tableView = careerInformationViewController?.tableView else {
            XCTFail(Fail.careerNotTableView.rawValue)
            return
        }
        let numberOfSections = tableView.numberOfSections
        
        for section in 0..<numberOfSections {
            XCTAssertEqual(tableView.numberOfRows(inSection: section), 1)
        }
    }
}
