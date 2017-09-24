import UIKit

class LoginPresenter {
    weak var viewController: LoginViewControllerProtocol?
    lazy var interactor: LoginInteractorProtocol = LoginInteractor(presenter: self)
    weak var router: (NSObjectProtocol & LoginRouterProtocol)?

    var routeModel: LoginRouteModel?
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
        self.router = LoginRouter(viewController: viewController)
    }
    
    func refreshViewModel() {
        guard let viewModel = viewController?.viewModel else { return }
        
        let newViewModel = LoginViewModel()
        viewController?.viewModel = newViewModel
    }
    
    func setRouteModel(model: LoginRouteModel) {
        self.routeModel = model

        //Pass stuff to ViewModel from another VC
        let viewModel = LoginViewModel()
        viewController?.viewModel = viewModel
    }
    
    // MARK: Routing
    
     func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
}

extension LoginPresenter: LoginPresenterEventHandlerProtocol {
    //Call the interactor
}

extension LoginPresenter: LoginPresenterProtocol {
    //Show something from the interactor
}
