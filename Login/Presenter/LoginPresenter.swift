import UIKit

class LoginPresenter {
    weak var viewController: LoginViewControllerProtocol?
    lazy var interactor: LoginInteractorProtocol = LoginInteractor(presenter: self)
    var router: (NSObjectProtocol & LoginRouterProtocol & LoginDataPassing)?

    var routeModel: RouteModelProtocol?
    
    init(viewController: LoginViewControllerProtocol) {
        self.viewController = viewController
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
}

extension LoginPresenter: LoginEventHandlerProtocol {
    
    func prepare(for segue: UIStoryboardSegue) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if var router = router, router.responds(to: selector) {
                router.routeModel = routeModel
                router.perform(selector, with: segue)
            }
        }
    }
    
    func didTapSignUpButton() {
//        Segue
//        let vc = viewController as? LoginViewController
//        vc?.performSegue(withIdentifier: "SignUp", sender: viewController)
//
//        Routing
//        viewController.router.routeToSignUp(segue: nil)
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    //Present something from the interactor
}

