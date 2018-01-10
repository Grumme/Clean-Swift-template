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
        let viewModel = LoginViewModel()
        viewController?.viewModel = viewModel
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
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    func didTapSignUpButton() {
//        Segue
//        viewController?.performSegue(withIdentifier: "SignUp", sender: viewController)
//
//        Routing
//        router?.routeToSignUp(segue: nil)
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    //Present something from the interactor
}

