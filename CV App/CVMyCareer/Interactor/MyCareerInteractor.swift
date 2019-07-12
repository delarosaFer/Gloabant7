import Foundation

final class MyCareerInteractor: MyCareerInputInteractorProtocol {
    // MARK: - Properties
    var presenter: MyCareerOutputInteractorProtocol?
    var positionTable = [[String : AnyObject]]()
    
    // MARK: - Methods
    /**
     Method for create and fetch the request.
     
     - Parameters:
        - endpoint: endpoint to request.
     */
    func fetchMyCareer(endpoint: String) {
        let client = Request()
        client.request(endpoint, entity: MyCareer.self) { [weak self] fetchResult in
            switch fetchResult{
            case .success(let data):
                guard let myCareerFetch: MyCareer = client.jsonDecode(data: data) else { return }
                guard let _ = self?.presenter?.myCareerFeteched(myCareer: myCareerFetch) else{
                    self?.presenter?.userFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.userFetchFailed()
            }
        }
    }
}
