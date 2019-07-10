
import UIKit

protocol VIPERModuleType: class {
    var viewController: UIViewController? { get set }
}

protocol VIPERViewType {
    
}

protocol VIPERInteractorType {
    
}

protocol VIPERPresenterType {
    var view: VIPERViewType { get set }
    var interactor: VIPERInteractorType { get set }
    var router: VIPERRouterType { get set }
}

protocol VIPERRouterType {
    
}

// MARK: - Properties
var view: MainViewControllerProtocol?
var interactor: MainInputInteractorProtocol?
var router: MainRouterProtocol?
