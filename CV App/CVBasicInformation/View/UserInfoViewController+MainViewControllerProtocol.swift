
import UIKit

extension UserInfoViewController: MainViewControllerProtocol  {
    
    // MARK: - Methods for display information
    /**
     Method to set all the user basic information.
     
     - Parameters:
     - user: Entity UserInfo.
     */
    func showUserInfo(with user: UserInfo) {
        let userInfo = user
        let userName = userInfo.userName
        let imageURL = userInfo.imageURL
        let age = NSLocalizedString(StringKey.age.rawValue, comment: Comment.labelAge.rawValue) + String(userInfo.age)
        let email = NSLocalizedString(StringKey.email.rawValue, comment: Comment.labelEmail.rawValue) + userInfo.email
        let cellphone = NSLocalizedString(StringKey.phone.rawValue, comment: Comment.labelPhone.rawValue) + userInfo.cellphone
        let aboutMySkills = NSLocalizedString(StringKey.skills.rawValue, comment: Default.empty.rawValue) + "\n" + userInfo.skills
        presenter?.getImage(imageURL: imageURL ?? Default.empty.rawValue)
        DispatchQueue.main.async  { [weak self] in
            self?.userNameLabel?.text = userName
            self?.ageLabel?.text = String(age)
            self?.cellphoneLabel?.text = cellphone
            self?.emailLabel?.text = email
            self?.aboutMeLabel?.text = aboutMySkills
        }
    }
    
    /**
     Method that creates the image given a data.
     
     - Parameters:
     - data: data of the image.
     */
    func imageWithData(data: Data){
        DispatchQueue.main.async { [weak self] in
            let image = UIImage(data: data)
            self?.profileUserImage?.image = image
            self?.profileUserImage?.circled()
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
    
    // MARK: - Animation methods
    /**
     Method for animated the pulse.
     */
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
    
    
    /**
     Method for create a pulse.
     */
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
}
