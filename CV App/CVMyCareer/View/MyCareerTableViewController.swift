
import UIKit

final class MyCareerTableViewController: UITableViewController, MyCareerViewControllerProtocol {
    
    // MARK: - Properties
    var myCareerMeList: MyCareer?
    var presenter: MyCareerPresenterProtocol?
    let titleView = NSLocalizedString(StringKey.myCareer.rawValue, comment: Comment.myCareer.rawValue)
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = titleView
        tableView.tableFooterView = UIView()
        presenter?.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
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
        let alertTitle = NSLocalizedString(StringKey.titleError.rawValue, comment: Comment.titleError.rawValue)
        let alertMessage = NSLocalizedString(StringKey.messageError.rawValue, comment: Comment.messageError.rawValue)
        DispatchQueue.main.sync { [weak self] in
            AlertView.instance.showAlert(title: alertTitle, message: alertMessage)
            self?.view.addSubview(AlertView.instance.parentView ?? AlertView())
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return myCareerMeList?.sections ?? NumberI.empty.rawValue
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return myCareerMeList?.studies.rowsInSection ?? NumberI.empty.rawValue
            
        case 1:
            return myCareerMeList?.currentJob.rowsInSection ?? NumberI.empty.rawValue
            
        case 2:
            return myCareerMeList?.lastJob.rowsInSection ?? NumberI.empty.rawValue
            
        default:
            return NumberI.empty.rawValue
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return myCareerMeList?.studies.titleSection
        }
        if section == 1{
            return myCareerMeList?.currentJob.titleSection
        }
        
        if section == 2{
            return myCareerMeList?.lastJob.titleSection
        }
        
        return Default.empty.rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cell.rawValue, for: indexPath)
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = NumberI.empty.rawValue
        if indexPath.section == 0{
            cell.textLabel?.text = myCareerMeList?.studies.studie
        }
        if indexPath.section == 1{
            cell.textLabel?.text = myCareerMeList?.currentJob.text
        }
        if indexPath.section == 2{
            cell.textLabel?.text = myCareerMeList?.lastJob.resume
        }
        
        return cell
    }
}
