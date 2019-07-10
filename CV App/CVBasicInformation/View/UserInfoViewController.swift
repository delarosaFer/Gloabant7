
import UIKit

final class UserInfoViewController: UIViewController {
    // MARK: - Properties
    var presenter: MainPresenterProtocol?
    var user: UserInfo?
    var linkedInUrl: String?
    var pulseLayers = [CAShapeLayer]()
    var moreInfoButton: UIButton?
    var navigationDelegate: NavigationDelegate?

    // MARK: - Outlets
    @IBOutlet weak var userNameLabel: UILabel?
    @IBOutlet weak var ageLabel: UILabel?
    @IBOutlet weak var emailLabel: UILabel?
    @IBOutlet weak var cellphoneLabel: UILabel?
    @IBOutlet weak var profileUserImage: UIImageView?
    @IBOutlet weak var aboutMeLabel: UILabel?
    
    //MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.updateView()
        
        configureMoreInfoButton(CircleButtonFactory.createCircleButton())
        
        if let navigationController = self.navigationController {
            navigationDelegate = NavigationDelegate()
            navigationController.delegate = navigationDelegate
        }
    }

    func configureMoreInfoButton(_ button: UIButton?) {
        moreInfoButton = button
        guard let button = button else {
            return
        }
        
        self.view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: Metrics.circleMultiplier),
            button.heightAnchor.constraint(equalTo: button.widthAnchor),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -Metrics.defaultSpace),
            button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.defaultSpace)
            ])
        
        button.addTarget(self, action: #selector(didTapMoreInfoButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        guard let profileImage = self.profileUserImage else {
            return
        }
        
        let pulse = PulseScaleAnimationFactory(forView: profileImage)
        
        DispatchQueue.main.async {
            pulse.animatePulse()
        }
        
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

    @objc func didTapMoreInfoButton() {
        presenter?.myCareerPressed()
    }
}

// MARK: - UIViewController Extension
extension UIViewController{
    func reloadViewFromNib(){
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view)
    }
}
