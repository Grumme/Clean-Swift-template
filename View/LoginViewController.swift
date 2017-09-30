import UIKit

class LoginViewController: UIViewController {
    
    lazy var eventHandler: LoginEventHandlerProtocol = LoginPresenter(viewController: self)
    var router: (NSObjectProtocol & LoginRouterProtocol & LoginDataPassing)?
    
    var viewModel: LoginViewModel? {
        didSet {
            refresh()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        let viewController = self
        let router = LoginRouter()
        viewController.router = router
        router.viewController = viewController
    }
    
    // MARK: Interface Builder Outlets
    
    // MARK: Interface Builder Actions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let scene = segue.identifier {
            let presenter = eventHandler as? LoginPresenter
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if var router = router, router.responds(to: selector) {
                router.routeModel = presenter?.routeModel
                router.perform(selector, with: segue)
            }
        }
    }
}

extension LoginViewController {
    func refresh() {
        //Do something
    }
}

extension LoginViewController: LoginViewControllerProtocol {
    
}

