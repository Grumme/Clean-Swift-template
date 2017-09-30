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
    }
    
    // MARK: Interface Builder Outlets
    
    // MARK: Interface Builder Actions
    
}

extension LoginViewController {
    func refresh() {
        //Do something
    }
}

extension LoginViewController: LoginViewControllerProtocol {
    
}
