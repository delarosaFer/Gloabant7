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
    var user: UserInfo?
    var linkedInUrl: String?
    var pulseLayers = [CAShapeLayer]()
    // MARK: - Outlets
    @IBOutlet weak var userNameLabel: UILabel?
    @IBOutlet weak var ageLabel: UILabel?
    @IBOutlet weak var emailLabel: UILabel?
    @IBOutlet weak var cellphoneLabel: UILabel?
    @IBOutlet weak var profileUserImage: UIImageView?
    @IBOutlet weak var emptyStateView: UIView?
    @IBOutlet weak var myCareerButton: UIButton?
    @IBOutlet weak var aboutMeButton: UIButton?
    @IBOutlet weak var achivementsButton: UIButton?
    @IBOutlet weak var stackview: UIStackView?
    
    @IBOutlet weak var bottomContainer: UIView?
   
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        profileUserImage?.layer.cornerRadius = profileUserImage?.frame.size.width ?? CGFloat(NumberF.zero.rawValue) / CGFloat(NumberF.half.rawValue)
        
        //Constraints
//        profileUserImage?.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        let ageLabelConstraint = NSLayoutConstraint(item: ageLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 5)
//        let cellphoneLabelContraint = NSLayoutConstraint(item: cellphoneLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 5)
//        let emailLabelConstraint = NSLayoutConstraint(item: emailLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 5)
//
//        //Add constraints
//        self.view.addConstraints([ageLabelConstraint, emailLabelConstraint, cellphoneLabelContraint])
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
        profileUserImage?.layer.removeAllAnimations()
    }
    // MARK: Methods for display information
    
    //Method for paint all the user basic information from the requesr
    func showUserInfo(with user: UserInfo) {
        let userInfo = user
        let userName = userInfo.userName
        let imageURL = userInfo.imageURL
        let age = String("\(UserInfoStrings.age.getText()) \(userInfo.age)")
        let email = UserInfoStrings.email.getText() + " " + userInfo.email
        let cellphone = UserInfoStrings.phone.getText() + " " + userInfo.cellphone
        presenter?.getImage(imageURL: imageURL ?? Default.empty.rawValue)
        DispatchQueue.main.async  { [weak self] in
            self?.userNameLabel?.text = userName
            self?.ageLabel?.text = age
            self?.cellphoneLabel?.text = cellphone
            self?.emailLabel?.text = email
        }
    }
    
    //Create the image by a data
    func imageWithData(data: Data){
        DispatchQueue.main.async { [weak self] in
            let image = UIImage(data: data)
            self?.profileUserImage?.image = image
        }
    }
    
    // Create the aler for a error
    func showNetworkingError() {
        let alertTitle = NSLocalizedString(StringKey.titleError.rawValue, comment: Comment.titleError.rawValue)
        let alertMessage = NSLocalizedString(StringKey.messageError.rawValue, comment: Comment.messageError.rawValue)
        DispatchQueue.main.sync { [weak self] in
            self?.emptyStateView?.isHidden = false
            AlertView.instance.showAlert(title: alertTitle, message: alertMessage)
            self?.view.addSubview(AlertView.instance.parentView ?? AlertView())
        }
    }
    //MARK: - Animation methods
    
    //Method for animated the pulse
    func animatePulse(index: Int){
        pulseLayers[index].strokeColor = UIColor.white.cgColor
        let scaleAnimation = CABasicAnimation(keyPath: AnimationKey.transform.rawValue)
        
        scaleAnimation.duration = CFTimeInterval(NumberF.duration.rawValue)
        scaleAnimation.fromValue = NumberF.zero.rawValue
        scaleAnimation.toValue = NumberF.toValue.rawValue
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        scaleAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(scaleAnimation, forKey: AnimationKey.scale.rawValue)
        
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.duration = CFTimeInterval(NumberF.duration.rawValue)
        opacityAnimation.fromValue = NumberF.toValue.rawValue
        opacityAnimation.toValue = NumberF.zero.rawValue
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        opacityAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(scaleAnimation, forKey: AnimationKey.opacity.rawValue)
    }
    //Method for create a pulse
    func createPulse() {
        for _ in 0...2{
            let circularPath = UIBezierPath(arcCenter: .zero, radius: UIScreen.main.bounds.size.width / CGFloat(NumberF.half.rawValue), startAngle: CGFloat(NumberF.zero.rawValue) , endAngle: CGFloat(NumberF.half.rawValue * .pi) , clockwise: true)
            let pulseLayer = CAShapeLayer()
            pulseLayer.path = circularPath.cgPath
            pulseLayer.lineWidth = CGFloat(NumberF.half.rawValue)
            pulseLayer.fillColor = UIColor.clear.cgColor
            pulseLayer.lineCap = CAShapeLayerLineCap.round
            pulseLayer.position = CGPoint(x: profileUserImage?.bounds.width ?? CGFloat(NumberF.zero.rawValue), y: CGFloat(NumberF.zero.rawValue))
            profileUserImage?.layer.addSublayer(pulseLayer)
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
