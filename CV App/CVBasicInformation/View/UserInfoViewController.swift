//
//  ViewController.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 5/31/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit
import WebKit

class UserInfoViewController: UIViewController, MainViewControllerProtocol {
    //MARK: - Properties
    var presenter: MainPresenterProtocol?
    var user: UserResult?
    var linkedInUrl: String?
    var pulseLayers = [CAShapeLayer]()
    // MARK: - Outlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cellphoneLabel: UILabel!
    @IBOutlet weak var profileUserImage: UIImageView!
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var myCareerButton: UIButton!
    @IBOutlet weak var aboutMeButton: UIButton!
    @IBOutlet weak var achivementsButton: UIButton!
    @IBOutlet weak var stackview: UIStackView!
    
    @IBOutlet weak var bottomContainer: UIView!
   
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        profileUserImage.layer.cornerRadius = profileUserImage.frame.size.width/2.0
        
        //Constraints
        profileUserImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let ageLabelConstraint = NSLayoutConstraint(item: ageLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 5)
        let cellphoneLabelContraint = NSLayoutConstraint(item: cellphoneLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 5)
        let emailLabelConstraint = NSLayoutConstraint(item: emailLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 5)

        //Add constraints
        self.view.addConstraints([ageLabelConstraint, emailLabelConstraint, cellphoneLabelContraint])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createPulse()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
      profileUserImage.layer.removeAllAnimations()
    }
    // MARK: Methods for display information
    
    //Method for paint all the user basic information from the requesr
    func showUserInfo(with user: UserResult) {
        let userInfo = user.response.userInfo
        let userName = userInfo.userName
        _ = userInfo.linkedInURL
        let imageURL = userInfo.imageURL
        let age = userInfo.age
        let email = userInfo.email
        let cellphone = userInfo.cellphone
        presenter?.getImage(imageURL: imageURL ?? "nil")
        DispatchQueue.main.async  { [weak self] in
            self?.userNameLabel.text = userName
            self?.ageLabel.text = age
            self?.cellphoneLabel.text = cellphone
            self?.emailLabel.text = email
        }
    }
    
    //Create the image by a data
    func imageWithData(data: Data){
        DispatchQueue.main.async { [weak self] in
            let image = UIImage(data: data)
            self?.profileUserImage.image = image
        }
    }
    
    // Create the aler for a error
    func showNetworkingError() {
        let alertTitle = NSLocalizedString("Error", comment: "")
        let alertMessage = NSLocalizedString("There was an error loading the information", comment: "")
        DispatchQueue.main.sync { [weak self] in
            self?.emptyStateView.isHidden = false
            AlertView.instance.showAlert(title: alertTitle, message: alertMessage)
            self?.view.addSubview(AlertView.instance.parentView)
        }
    }
    //MARK: - Animation methods
    
    //Method for animated the pulse
    func animatePulse(index: Int){
        pulseLayers[index].strokeColor = UIColor.white.cgColor
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        scaleAnimation.duration = 6.6
        scaleAnimation.fromValue = 0.0
        scaleAnimation.toValue = 1.4
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        scaleAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(scaleAnimation, forKey: "scale")
        
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.duration = 6.6
        opacityAnimation.fromValue = 1.4
        opacityAnimation.toValue = 0.0
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        opacityAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(scaleAnimation, forKey: "opacity")
    }
    //Method for create a pulse
    func createPulse() {
        for _ in 0...2{
            let circularPath = UIBezierPath(arcCenter: .zero, radius: UIScreen.main.bounds.size.width/2.0, startAngle: 0 , endAngle: 2 * .pi , clockwise: true)
            let pulseLayer = CAShapeLayer()
            pulseLayer.path = circularPath.cgPath
            pulseLayer.lineWidth = 2.0
            pulseLayer.fillColor = UIColor.clear.cgColor
            pulseLayer.lineCap = CAShapeLayerLineCap.round
            pulseLayer.position = CGPoint(x: profileUserImage.bounds.width, y: 0)
            profileUserImage.layer.addSublayer(pulseLayer)
            pulseLayers.append(pulseLayer)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.animatePulse(index: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                self.animatePulse(index: 1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                    self.animatePulse(index: 2)
                }
            }
        }
    }
    
    //MARK: - Buttons
    @IBAction func aboutMeButton(_ sender: Any) {
        presenter?.aboutMePressed()
    }
    
    @IBAction func myCareerButton(_ sender: Any) {
        presenter?.myCareerPressed()
    }
    
    @IBAction func achivementsButton(_ sender: Any) {
        presenter?.achivementsPressed()
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        reloadViewFromNib()
    }
    @IBAction func linkedInButton(_ sender: Any) {
    }
}

//MARK: - UIViewController Extension
extension UIViewController{
    func reloadViewFromNib(){
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view)
    }
}
