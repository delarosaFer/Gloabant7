//
//  CVAboutTableViewController.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/4/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class CVAboutTableViewController: UITableViewController, AboutMeViewControllerProtocol {
    //MARK: - Properties
    var aboutMeList: AboutMe?
    var presenter: AboutMePresenterProtocol?
    let titleView = NSLocalizedString(StringKey.aboutMe.rawValue, comment: Comment.aboutMe.rawValue)
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = titleView
        tableView.tableFooterView = UIView()
        presenter?.viewDidLoad()
    }
    
    func showAboutMe(with aboutMe: AboutMe) {
        aboutMeList = aboutMe
        DispatchQueue.main.async { [weak self ] in
            self?.tableView.reloadData()
        }
    }
    //Method for display the generic alert
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
        return aboutMeList?.sections ?? NumberI.empty.rawValue
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return aboutMeList?.about.rowsInSection ?? NumberI.empty.rawValue
            
        case 1:
            return aboutMeList?.hobbies.rowsInSection ?? NumberI.empty.rawValue
            
        case 2:
            return aboutMeList?.skills.rowsInSection ?? NumberI.empty.rawValue
            
        default:
            return NumberI.empty.rawValue
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return aboutMeList?.about.titleSection
        }
        if section == 1{
            return aboutMeList?.hobbies.titleSection
        }
        if section == 2{
            return aboutMeList?.skills.titleSection
        }
        return Default.empty.rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cell.rawValue, for: indexPath)
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        if indexPath.section == 0{
            cell.textLabel?.text = aboutMeList?.about.text
        }
        if indexPath.section == 1{
            cell.textLabel?.text = aboutMeList?.hobbies.text
        }
        if indexPath.section == 2{
            cell.textLabel?.text = aboutMeList?.skills.resume
        }
        return cell 
        
    }
}
