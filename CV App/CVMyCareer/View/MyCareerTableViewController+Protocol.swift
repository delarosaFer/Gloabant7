import UIKit

extension MyCareerTableViewController: MyCareerViewControllerProtocol  {
    func showMyCareer(with myCareer: MyCareer) {
        myCareerMeList = myCareer
        DispatchQueue.main.async { [weak self ] in
            self?.tableView.reloadData()
        }
    }
    
    /**
     Method that display the alert when occurs an network error.
     */
    func showNetworkingError() {
        DispatchQueue.main.async { [weak self] in
            let alertTitle = NSLocalizedString(StringKey.titleError.rawValue, comment: Comment.titleError.rawValue)
            let alertMessage = NSLocalizedString(StringKey.messageError.rawValue, comment: Comment.messageError.rawValue)
            let alertView = AlertView(title: alertTitle, message: alertMessage, preferredStyle: .actionSheet)
            alertView.addAction(UIAlertAction(title: NSLocalizedString(StringKey.refreshAction.rawValue, comment: Comment.refreshAction.rawValue), style: .default, handler: { (action) in
                self?.presenter?.updateView()
            }))
            self?.present(alertView, animated: true)
        }
    }
}
