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
    var moreInfoButton: UIButton?
    var navigationDelegate: NavigationDelegate?

   
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

        
        moreInfoButton = UIButton(frame: .zero)
        moreInfoButton?.translatesAutoresizingMaskIntoConstraints = false
        moreInfoButton?.setTitle("+", for: .normal)
        moreInfoButton?.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        moreInfoButton?.backgroundColor = .red
        
        guard let moreInfoButton = moreInfoButton else {
            return
        }
        
        self.view.addSubview(moreInfoButton)
        NSLayoutConstraint.activate([
        moreInfoButton.heightAnchor.constraint(equalToConstant: 75),
        moreInfoButton.heightAnchor.constraint(equalTo: moreInfoButton.widthAnchor, multiplier: 1),
        moreInfoButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -37.5),
        moreInfoButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -37.5)
            ])
        
        
        moreInfoButton.addTarget(self, action: #selector(didTapMoreInfoButton), for: .touchUpInside)
        if let navigationController = self.navigationController {
            navigationDelegate = NavigationDelegate()
            navigationController.delegate = navigationDelegate
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createPulse()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moreInfoButton?.circled()
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
        let age = NSLocalizedString(StringKey.age.rawValue, comment: Comment.labelAge.rawValue) + String(userInfo.age)
        let email = NSLocalizedString(StringKey.email.rawValue, comment: Comment.labelEmail.rawValue) + userInfo.email
        let cellphone = NSLocalizedString(StringKey.phone.rawValue, comment: Comment.labelPhone.rawValue) + userInfo.cellphone
        presenter?.getImage(imageURL: imageURL ?? Default.empty.rawValue)
        DispatchQueue.main.async  { [weak self] in
            self?.userNameLabel?.text = userName
            self?.ageLabel?.text = String(age)
            self?.cellphoneLabel?.text = cellphone
            self?.emailLabel?.text = email
        }
    }
    
    //Create the image by a data
    func imageWithData(data: Data){
        DispatchQueue.main.async { [weak self] in
            let image = UIImage(data: data)
            self?.profileUserImage?.image = image
            self?.profileUserImage?.circled()
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
    
    @objc func didTapMoreInfoButton() {
        presenter?.myCareerPressed()
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



class MaterialShowAnimator: NSObject {
}

extension MaterialShowAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from),
            let overViewController = fromViewController as? UserInfoViewController,
            let button = overViewController.moreInfoButton
            else {
                return
        }
        
        let blackView = UIView(frame: overViewController.view.frame)
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0
        overViewController.view.addSubview(blackView)
        
        let startFrame = button.frame
        
        toViewController.view.frame = startFrame
        toViewController.view.layer.cornerRadius = startFrame.height / 2.0
        transitionContext.containerView.addSubview(toViewController.view)
        
        let animationTiming = UICubicTimingParameters(animationCurve: .easeInOut)
        
        let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), timingParameters: animationTiming)
        
        animator.addAnimations {
            toViewController.view.frame = transitionContext.finalFrame(for: toViewController)
            toViewController.view.layer.cornerRadius = 0
            blackView.alpha = 1
        }
        
        animator.addCompletion { finished in
            blackView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        animator.startAnimation()
    }
}

class NavigationDelegate: NSObject, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop {
            return MaterialHideAnimator()
        } else {
            return MaterialShowAnimator()
        }
    }
}


class MaterialHideAnimator: NSObject {
}

extension MaterialHideAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from),
            let overViewController = toViewController as? UserInfoViewController,
            let button = overViewController.moreInfoButton
            else {
                return
        }
        
        let blackView = UIView(frame: overViewController.view.frame)
        blackView.backgroundColor = UIColor.black
        overViewController.view.addSubview(blackView)
        
        
        let transitionContainer = transitionContext.containerView
        transitionContainer.addSubview(toViewController.view)
        transitionContainer.addSubview(fromViewController.view)
        
        let animationTiming = UICubicTimingParameters(animationCurve: .easeInOut)
        
        let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), timingParameters: animationTiming)
        
        animator.addAnimations {
            fromViewController.view.frame = button.frame
            fromViewController.view.layer.cornerRadius = button.frame.height / 2
            blackView.alpha = 0
        }
        
        animator.addCompletion { finished in
            blackView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        animator.startAnimation()
    }
}
