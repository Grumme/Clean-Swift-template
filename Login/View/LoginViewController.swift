import UIKit

class LoginViewController: UIViewController {
    
    lazy var eventHandler: LoginEventHandlerProtocol = LoginPresenter(viewController: self)
    
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
        let loginPresenter = eventHandler as! LoginPresenter
        loginPresenter.router = router
        router.viewController = viewController
    }
    
    // MARK: Interface Builder Outlets
    
    // MARK: Interface Builder Actions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        eventHandler.prepare(for: segue)
    }
}

extension LoginViewController {
    func refresh() {
        //Do something
    }
}

extension LoginViewController: LoginViewControllerProtocol {
    
}

