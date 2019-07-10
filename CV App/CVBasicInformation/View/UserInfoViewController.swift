
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
    @IBOutlet weak var emptyStateView: UIView?
    @IBOutlet weak var myCareerButton: UIButton?
    @IBOutlet weak var stackview: UIStackView?
    
    //MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.updateView()
        moreInfoButton = CircleButtonFactory.createCircleButton()

        guard let moreInfoButton = moreInfoButton else {
            return
        }
        
        self.view.addSubview(moreInfoButton)
        NSLayoutConstraint.activate([
            moreInfoButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            moreInfoButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            moreInfoButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8.0),
            moreInfoButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8.0)
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

    @IBAction func refreshButton(_ sender: Any) {
        reloadViewFromNib()
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
