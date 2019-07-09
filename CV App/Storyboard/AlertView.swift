//
//  AlertView.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/12/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class AlertView: UIView {
    
    //MARK: - Properties
    static let instance = AlertView()
    
    //MARK: - Outlets
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertContent: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    
    //MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //Method for instance the generic alert
    private func commonInit(){
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        alertContent.layer.cornerRadius = 6
        okButton.layer.cornerRadius = 6
        headerView.layer.cornerRadius = 6
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    /// This method will change the properties of the generic alert
    ///
    /// - Parameters:
    ///   - title: The title of the alert
    ///   - message: The description of the generic alert
    func showAlert(title: String, message: String) {
        titleLabel.text = title
        descriptionLabel.text = message
        
    }
    
    //MARK: - Buttons
    @IBAction func okAction(_ sender: Any) {
        parentView.removeFromSuperview()
    }
}
