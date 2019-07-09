//
//  MyCareerTableViewController.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/10/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class MyCareerTableViewController: UITableViewController, MyCareerViewControllerProtocol {
    
    //MARK: - Properties
    var myCareerMeList: MyCareerResult?
    var presenter: MyCareerPresenterProtocol?
    let titleView = NSLocalizedString("My Career", comment: "")
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = titleView
        tableView.tableFooterView = UIView()
        presenter?.viewDidLoad()
        
    }
    
    func showMyCareer(with myCareer: MyCareerResult) {
        myCareerMeList = myCareer
        DispatchQueue.main.async { [weak self ] in
            self?.tableView.reloadData()
        }
    }
    
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
        return myCareerMeList?.myCareerResponse.MyCareer.sections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return myCareerMeList?.myCareerResponse.MyCareer.Studies.rowsInSection ?? 0
            
        case 1:
            return myCareerMeList?.myCareerResponse.MyCareer.CurrentJob.rowsInSection ?? 0
            
        case 2:
            return myCareerMeList?.myCareerResponse.MyCareer.LastJob.rowsInSection ?? 0
            
        default:
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return myCareerMeList?.myCareerResponse.MyCareer.Studies.titleSection
        }
        if section == 1{
            return myCareerMeList?.myCareerResponse.MyCareer.CurrentJob.titleSection
        }
        
        if section == 2{
            return myCareerMeList?.myCareerResponse.MyCareer.LastJob.titleSection
        }
        
        return "Nil"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        if indexPath.section == 0{
            cell.textLabel?.text = myCareerMeList?.myCareerResponse.MyCareer.Studies.studie
        }
        if indexPath.section == 1{
            cell.textLabel?.text = myCareerMeList?.myCareerResponse.MyCareer.CurrentJob.text
        }
        if indexPath.section == 2{
            cell.textLabel?.text = myCareerMeList?.myCareerResponse.MyCareer.LastJob.resume
        }
        
        return cell
    }
}
