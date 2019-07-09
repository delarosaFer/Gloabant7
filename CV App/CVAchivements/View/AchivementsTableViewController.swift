//
//  AchivementsTableViewController.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/11/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class AchivementsTableViewController: UITableViewController, AchivementsViewControllerProtocol {
    
    //MARK: - Properties
    var achivementsList: AchivementsResult?
    var presenter: AchivementsPresenterProtocol?
    let titleView = NSLocalizedString("Achivements", comment: "")
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = titleView
        tableView.tableFooterView = UIView()
        presenter?.viewDidLoad()
    }
    
    func showAchivements(with achivements: AchivementsResult) {
        achivementsList = achivements
        DispatchQueue.main.async { [weak self ] in
            self?.tableView.reloadData()
        }
    }
    
    //Methods for display the generic alert
    func showNetworkingError() {
        let alertTitle = NSLocalizedString("Error", comment: "")
        let alertMessage = NSLocalizedString("There was an error loading", comment: "")
        DispatchQueue.main.sync { [weak self] in
            AlertView.instance.showAlert(title: alertTitle, message: alertMessage)
            self?.view.addSubview(AlertView.instance.parentView)
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return achivementsList?.achivementsResponse.Achivements.sections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return achivementsList?.achivementsResponse.Achivements.Courses.rowsInSection ?? 0
            
        case 1:
            return achivementsList?.achivementsResponse.Achivements.Talks.rowsInSection ?? 0
            
        case 2:
            return achivementsList?.achivementsResponse.Achivements.Extras.rowsInSection ?? 0
            
        default:
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return achivementsList?.achivementsResponse.Achivements.Courses.titleSection
        }
        if section == 1 {
            return achivementsList?.achivementsResponse.Achivements.Talks.titleSection
        }
        if section == 2 {
            return achivementsList?.achivementsResponse.Achivements.Extras.titleSection
        }
        
        return "Nil"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        if indexPath.section == 0 {
            cell.textLabel?.text = achivementsList?.achivementsResponse.Achivements.Courses.CiscoCCNA
        }
        if indexPath.section == 1 {
            
            if indexPath.row == 0 {
                cell.textLabel?.text = achivementsList?.achivementsResponse.Achivements.Talks.talk1
            }
            if indexPath.row == 1 {
               cell.textLabel?.text = achivementsList?.achivementsResponse.Achivements.Talks.talk2
            }
        }
        if indexPath.section == 2 {
            cell.textLabel?.text = achivementsList?.achivementsResponse.Achivements.Extras.resume
        }
        
        return cell
    }
}
