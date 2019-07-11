//
//  AlertView.swift
//  CV App
//
//  Created by Fernando De La Rosa Salas on 7/11/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

class AlertView: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let alertTitle = title else { return }
        let attributedTitle = NSAttributedString(string: alertTitle, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat(FontSize.alertTile.rawValue)), NSAttributedString.Key.foregroundColor : UIColor.black])
        setValue(attributedTitle, forKey: StringKey.attributedTitle.rawValue)
        
        guard let alertMessage = message else { return }
        let attributedMessage = NSAttributedString(string: alertMessage, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat(FontSize.alertMessage.rawValue)), NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        setValue(attributedMessage, forKey: StringKey.attributedMessage.rawValue)
        
        view.tintColor = .customRed
    }
}
